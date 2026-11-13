# Sporadisk OOM
Feilmelding: 
java.lang.OutOfMemoryError: Java heap space
->org.geoserver.wms.map.RenderedImageMapOutputFormat.prepareImage(RenderedImageMapOutputFormat.java:640)
logger: org.geoserver.ows

Inntruffet 4 ganger 13.11.2026, ser ikke ut til å påvirke videre kjøring på pod

Tiltak:
Øke heapspace fra ~1.5G(25% av RAM) til satt 4G

Videre oppfølging:
Hvis tiltaket ikke er tilstrekkelig kan en mulighet være å se på annen konfigurasjon: https://docs.geoserver.org/main/en/user/services/wms/configuration/#wms_configuration_limits