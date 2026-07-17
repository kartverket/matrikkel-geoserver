import {expect} from 'bun:test';
import {diffAsXml} from "diff-js-xml";
import odiff from "odiff-bin";
import type {Logger} from "./logging.ts";


export type TestCase =
    | { method: 'GET'; path: string; }
    | { method: 'POST'; path: string; payload: string; };


export type GeoserverInstance = {
    url: string;
    auth: string;
}

const bodyFixes = [
    (body: string) => body.replace(
        'http://matrikkel-geoserver-prodtest.atkv3-prod.kartverket-intern.cloud/geoserver/',
        'https://prodtest.matrikkel.no/geoservergeo/'
    ),
    (body: string) => body.replaceAll(/(\d{4}-\d{2}-\d{2})T\d{2}:\d{2}:\d{2}.\d{3}Z/g, '$1T12:00:00.000Z')
]

type Result = { status: number; body: ArrayBuffer; contentType: string }

export async function runCase(
    base: GeoserverInstance,
    experiment: GeoserverInstance,
    testcase: TestCase,
    logger: Logger | null = null,
) {
    const baseValue = await runTest(base, testcase);
    const experimentValue = await runTest(experiment, testcase);

    expect(experimentValue).not.toBeUndefined()
    expect(baseValue).not.toBeUndefined()

    let equalContent: boolean;
    const contentType = baseValue.result.contentType;
    if (contentType.includes('/xml')) {
        const baseXML = arrayBufferAsString(baseValue.result.body);
        const expeXML = arrayBufferAsString(experimentValue.result.body);
        const xmlDiff = await diffXML(baseXML, expeXML);
        if (logger) {
            logger.log(xmlDiff);
        }
        equalContent = xmlDiff.length === 0;
    } else if (contentType === 'image/png') {
        await Bun.write('base.png', baseValue.result.body);
        await Bun.write('expe.png', experimentValue.result.body);
        const diff = await odiff.compare('base.png', 'expe.png', 'diff.png');
        equalContent = diff.match;
    } else {
        equalContent = arrayBuffersEquality(baseValue.result.body, experimentValue.result.body, logger);
    }

    if (logger) {
        logger.log('Result from testcase: ', testcase.method, testcase.path)
        logger.log('Base', `${baseValue.time.toFixed(2)}ms\t`, `${baseValue.result.status}\t`, `${baseValue.result.contentType}\t`, baseValue.result.body.byteLength)
        logger.log('Expe', `${experimentValue.time.toFixed(2)}ms\t`, `${experimentValue.result.status}\t`, `${experimentValue.result.contentType}\t`, experimentValue.result.body.byteLength)
        logger.log('Did content match: ', equalContent)
        logger.log();
        logger.log();
    }

    return {base: baseValue, exp: experimentValue, equalContent}
}

async function runTest(geoserver: GeoserverInstance, testcase: TestCase): Promise<Timing<Result>> {
    return measureTime<Result>(
        async () => {
            const response = await fetch(`${geoserver.url}${testcase.path}`, {
                method: testcase.method,
                headers: {
                    'Authorization': geoserver.auth,
                    ...(testcase.method === 'POST' ? {'Content-Type': 'text/xml'} : {})
                },
                body: testcase.method === 'POST' ? testcase.payload : undefined
            });
            const status = response.status;
            const contentType = response.headers.get('Content-Type') ?? 'unknown';
            if (contentType.includes('text/') || contentType.includes('application/xml') || contentType.includes('application/json')) {
                const body = await response.text();
                const fixed = bodyFixes.reduce((b, fix) => fix(b), body)
                return {status, body: stringAsArrayBuffer(fixed), contentType}
            } else {
                const body = await response.arrayBuffer();
                return {status, body, contentType}
            }
        }
    )
}

function stringAsArrayBuffer(value: string): ArrayBuffer {
    const encoder = new TextEncoder();
    const arr = encoder.encode(value);
    return arr.buffer;
}

function arrayBufferAsString(buffer: ArrayBuffer): string {
    const decoder = new TextDecoder();
    return decoder.decode(buffer);
}

function arrayBuffersEquality(a: ArrayBuffer, b: ArrayBuffer, logger: Logger | null): boolean {
    return dataViewsEquality(new DataView(a), new DataView(b), logger);
}

function dataViewsEquality(a: DataView, b: DataView, logger: Logger | null) {
    if (a.byteLength !== b.byteLength) {
        if (logger) {
            logger.log('Different lengths', a.byteLength, b.byteLength);
        }
        return false;
    }
    for (let i = 0; i < a.byteLength; i++) {
        if (a.getUint8(i) !== b.getUint8(i)) {
            const aBuf = [];
            const bBuf = [];
            for (let j = -5; j < 5; j++) {
                aBuf.push(String.fromCharCode(a.getUint8(i + j)));
                bBuf.push(String.fromCharCode(b.getUint8(i + j)));
            }
            if (logger) {
                logger.log('Different byte value', i, a.getUint8(i), b.getUint8(i), 'Around', aBuf.join(''), bBuf.join(''));
            }
            return false;
        }
    }
    return true;
}

type Diff = {
    path: string;
    resultType: string;
    message: string;
};

async function diffXML(first: string, second: string): Promise<Diff[]> {
    return new Promise((resolve, reject) => {
        diffAsXml(first, second, undefined, undefined, resolve);
    })
}

type Timing<T> = { time: number; result: T; };
async function measureTime<TReturn>(
    fn: () => Promise<TReturn>,
): Promise<Timing<TReturn>> {
    const start = performance.now()
    const result = await fn();
    const end = performance.now()
    return {result, time: end - start}
}