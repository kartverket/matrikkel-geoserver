import {prefixRemover} from "./utils.ts";
import type {TestCase} from "./testcases.ts";

type LogLine = {
    line: string;
    fields: {
        method: string;
        path: string;
    };
};

const wfs_json: LogLine[] = await Bun.file('wfs_logs.json').json();
const wms_json: LogLine[] = await Bun.file('wms_logs.json').json();
const json: LogLine[] = [...wfs_json, ...wms_json];

const stripGeoserverPath = prefixRemover('/geoservergeo');
const stripped: TestCase[] = json.map(line => ({
    method: line.fields.method,
    path: stripGeoserverPath(line.fields.path),
}));

console.log('lines', stripped.length);

type Reducer<TAcc, TEl> = (acc: TAcc, element: TEl, index: number) => TAcc;
function uniqueBy<T, V extends any>(fn: (t: T) => V): Reducer<Map<V, T>, T> {
    return (acc, el) => {
        const key = fn(el);
        acc.set(key, el);
        return acc
    }
}

const unique: typeof stripped = Array.from(
    stripped.reduce(uniqueBy(it => it.path), new Map()).values()
);

console.log('unique lines', unique.length);

const classifications: Record<string, TestCase[]> = {}
for (const line of unique) {
    const fragments = line.path.split(/[\/?]/);
    const cls = line.method === 'POST' ? 'POST' : (fragments[1] ?? '');
    const group = classifications[cls] ?? [];
    group.push(line);
    classifications[cls] = group;
}

for (const [classification, lines] of Object.entries(classifications)) {
    await Bun.write(`cases/${classification}-cases.json`, JSON.stringify(lines))
}

const classificationCount = Object.fromEntries(
    Object.entries(classifications).map(([key, lines]) => [key, lines.length])
);

console.log(classificationCount);