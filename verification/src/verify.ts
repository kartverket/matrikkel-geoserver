import {type GeoserverInstance, runCase, type TestCase} from "./testcases.ts";

import postCases from '../cases/POST-cases.json';
import schemaCases from '../cases/schemas-cases.json';
import wfsCases from '../cases/wfs-cases.json';
import wmsCases from '../cases/wms-cases.json';
import {Logger} from "./logging.ts";

const allcases: Record<string, TestCase[]> = {
    pst: postCases as TestCase[],
    sch: schemaCases as TestCase[],
    wfs: wfsCases as TestCase[],
    wms: wmsCases as TestCase[],
}

const base: GeoserverInstance = {
    url: "https://prodtest.matrikkel.no/geoservergeo",
    auth: "Basic XX",
};
const expe: GeoserverInstance = {
    url: "https://matrikkel-geoserver-prodtest.atkv3-prod.kartverket-intern.cloud/geoserver",
    auth: "Basic XX",
};
const expeDev: GeoserverInstance = {
    url: "https://matrikkel-geoserver.atkv3-dev.kartverket-intern.cloud/geoserver",
    auth: "Basic XX",
};

const logger = new Logger();
const total = {
    success: 0,
    error: 0,
};
const time = {
    base: 0,
    expe: 0,
};

for (const [type, cases] of Object.entries(allcases)) {
    const marker = type.toUpperCase();
    let success = 0;
    let error = 0;
    logger.log('Starting tests of', type)
    for (let i = 0; i < cases.length; i++) {
        const currentCase = cases[i];
        const result = await runCase(base, expe, currentCase!, logger);
        time.base += result?.base?.time ?? 0;
        time.expe += result?.exp?.time ?? 0;

        if (result?.equalContent ?? false) {
            logger.log(`[${marker}-${(''+i).padStart(4, '0')}] OK`)
            success++;
        } else {
            logger.error(`[${marker}-${(''+i).padStart(4, '0')}] Mismatch in call to`, currentCase!.path)
            error++;
        }
    }
    logger.log('Completed tests of', type, `(${success} / ${cases.length}) ${error} errors`);
    total.error += error;
    total.success += success;
}

console.log(`Ran ${total.success + total.error} tests, found ${total.error} errors`);
console.log(`Total time used. Base: ${time.base} Exp: ${time.expe}`);
logger.writeTo('verification.log')