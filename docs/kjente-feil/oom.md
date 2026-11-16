# Sporadisk OOM
Feilmelding: 
java.lang.OutOfMemoryError: Java heap space
->org.geoserver.wms.map.RenderedImageMapOutputFormat.prepareImage(RenderedImageMapOutputFormat.java:640)
logger: org.geoserver.ows

Inntruffet 4 ganger 13.11.2026, ser ikke ut til å påvirke videre kjøring på pod

Tiltak:
Øke heapspace fra ~1.5G(25% av RAM) til satt 4G

## 16.11.2026: Fortsatt OOM etter 4G

Tiltak i prod (`.skip/prod.yaml`):
- Heapspace økt til 6G (`-Xmx6g`), RAM request 8G / limit 10G.
- `-XX:+ExitOnOutOfMemoryError`: JVM avsluttes og poden restartes ved første heap-OOM.

Hvorfor poden ikke restartet av seg selv:
- Heap-OOM dreper kun tråden, ikke JVM-en. Poden kan stå med nesten full heap og mye GC, og nye store kall gir flere OOM.
- Liveness/readiness går mot `:8602/health`, som auth-proxy sender videre til `GetCapabilities`. Den er billig og forblir grønn selv med full heap.
- Kubernetes restarter bare ved `OOMKilled` (kontainerminne > limit). Heap (`-Xmx6g`) ligger under limit (10G), så det skjer ikke.

Videre oppfølging:
- Aktivere heap dump (`-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=...`) for å se hva som fyller heapen. Krever skrivbart volum som overlever restart, og analyse i f.eks. Eclipse MAT.
- Hvis tiltakene ikke er tilstrekkelig kan en mulighet være å se på annen konfigurasjon: https://docs.geoserver.org/main/en/user/services/wms/configuration/#wms_configuration_limits
