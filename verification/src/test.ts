import {type GeoserverInstance, runCase, type TestCase} from "./testcases.ts";
import { diffAsXml } from 'diff-js-xml';
import {Logger} from "./logging.ts";

const base: GeoserverInstance = {
    url: "https://prodtest.matrikkel.no/geoservergeo/",
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


const schemaCase: TestCase = {"method": "GET", "path": "/schemas/gml/3.1.1/base/temporalTopology.xsd"};
const wmsCase: TestCase = {
    "method": "GET",
    "path": "/wms/MATRIKKEL?VERSION=1.1.1&REQUEST=GetMap&WIDTH=1000&HEIGHT=1000&SRS=EPSG:27393&BBOX=12122,219850,12326,220060&LAYERS=TEIGWFS,TEIGGRENSEWFS,TEIGGRENSEPUNKTWFS,GATEADRESSEWFS,MATRIKKELADRESSEWFS,BYGNINGWFS&STYLES=,,,,,&FORMAT=image/gif"
}
const wmsCase2: TestCase = {
    "method": "GET",
    "path": "/wms/MATRIKKEL?VERSION=1.1.1&REQUEST=GetMap&WIDTH=1000&HEIGHT=1000&SRS=EPSG:27393&BBOX=12122,219850,12326,220060&LAYERS=TEIGWFS,TEIGGRENSEWFS,TEIGGRENSEPUNKTWFS,GATEADRESSEWFS,MATRIKKELADRESSEWFS,BYGNINGWFS&STYLES=,,,,,&FORMAT=image/png"
};
const wfsCase: TestCase = {
    "method": "GET",
    "path": "/wfs/matrikkel?service=WFS&request=GetFeature&version=1.1.0&typename=matrikkel%3ATEIGWFS&srsname=EPSG%3A32632&bbox=842993.6020760176%2C7613939.175773495%2C846325.7114510176%2C7615704.40038287%2CEPSG%3A32632"
};
const postTest: TestCase = {
    "method": "POST",
    "path": "/wfs/MATRIKKEL?version=1.1.0?ServiceId=696",
    "payload": "<wfs:GetCapabilities \n  service=\"WFS\" \n  version=\"1.1.0\" \n  xmlns:wfs=\"http://opengis.net\" \n  xmlns:ows=\"http://www.opengis.net/ows\" \n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" \n  xsi:schemaLocation=\"http://opengis.net http://opengis.net\" />"
};
const postTest2: TestCase = {
    "method": "POST",
    "path": "/wfs/MATRIKKEL?version=1.1.0?ServiceId=684",
    "payload":"<wfs:GetCapabilities \n  service=\"WFS\" \n  version=\"1.1.0\" \n  xmlns:wfs=\"http://opengis.net\" \n  xmlns:ows=\"http://www.opengis.net/ows\" \n  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" \n  xsi:schemaLocation=\"http://opengis.net http://opengis.net\" />"
}

const logger = new Logger()
//await runCase(base, expe, schemaCase);
//await runCase(base, expe, wmsCase2, logger);
await runCase(base, expe, wfsCase, logger);
//await runCase(base, expe, postTest, logger);
//await runCase(base, expe, postTest2, logger);

await logger.writeTo('test.log')