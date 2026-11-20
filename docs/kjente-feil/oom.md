# Sporadisk OOM
Feilmelding: 
java.lang.OutOfMemoryError: Java heap space
->org.geoserver.wms.map.RenderedImageMapOutputFormat.prepareImage(RenderedImageMapOutputFormat.java:640)
logger: org.geoserver.ows

Inntruffet 4 ganger 13.11.2026, ser ikke ut til å påvirke videre kjøring på pod

Tiltak:
Øke heapspace fra 1G (base-image-default, se 20.11.2026) til satt 4G

## 16.11.2026: Fortsatt OOM etter 4G

Tiltak i prod (`.skip/prod.yaml`):
- Heapspace økt til 6G (`-Xmx6g`), RAM request 8G / limit 10G.
- `-XX:+ExitOnOutOfMemoryError`: JVM avsluttes og poden restartes ved første heap-OOM.

Hvorfor poden ikke restartet av seg selv:
- Heap-OOM dreper kun tråden, ikke JVM-en. Poden kan stå med nesten full heap og mye GC, og nye store kall gir flere OOM.
- Liveness/readiness går mot `:8602/health`, som auth-proxy sender videre til `GetCapabilities`. Den er billig og forblir grønn selv med full heap.
- Kubernetes restarter bare ved `OOMKilled` (kontainerminne > limit). Heap ligger under limit, så det skjer ikke.

## 20.11.2026: Heap var aldri økt – fortsatt 1G

`-Xmx` i `JAVA_OPTS` har ikke hatt effekt. Effektiv heap har vært 1G i alle miljøer, uansett hva vi satte.

### Årsak

1. Base-imaget `docker.osgeo.org/geoserver` setter `EXTRA_JAVA_OPTS="-Xms256m -Xmx1g"` og legger
   det først i `CATALINA_OPTS`
   ([Dockerfile L186–L215](https://github.com/geoserver/docker/blob/a82a7782c670e0bb969c197aceea3549a726e0a3/Dockerfile#L186-L215)).
2. GeoServers `startup.sh` starter Tomcat med `catalina.sh run`, som kaller Java med `"$JAVA_OPTS" "$CATALINA_OPTS"`
   i den rekkefølgen
   ([catalina.sh L352](https://github.com/apache/tomcat/blob/2e6c85ba0937f3dc9877dadd433167fcd45f8dbc/bin/catalina.sh#L352)).
3. Når samme JVM-flagg står flere ganger, vinner det siste. Kommandolinjen ble
   `... -Xmx6g ... -Xms256m -Xmx1g ...`, altså 1G heap.

Løsningen er å sette heap i `EXTRA_JAVA_OPTS`. Da erstattes base-imagets verdi, og `-Xmx1g` havner
aldri på kommandolinjen.

### Verifisering

- Base-image-default: `docker run --rm --entrypoint sh docker.osgeo.org/geoserver:3.0.1 -c 'echo $EXTRA_JAVA_OPTS'`
  gir `-Xms256m -Xmx1g`.
- Kjørende pod i prodtest: `jcmd 1 VM.flags` viste `MaxHeapSize=1073741824` (1 GiB) med 6G limit.
- Lokalt i base-imaget, samme rekkefølge som Tomcat: gammel prod-konfig (`-Xmx6g` i `JAVA_OPTS`) ga
  1 GiB heap, `EXTRA_JAVA_OPTS="-Xms256m -Xmx4g"` ga 4 GiB.

Sjekk etter deploy (der `kubectl exec` er tillatt):

```bash
kubectl exec <pod> -c matrikkel-geoserver -- jcmd 1 VM.flags | tr ' ' '\n' | grep MaxHeapSize
```

### Symptom

Kontaineren lå flatt på ~1,8 GiB (1G heap + metaspace/tråder/native minne) og fikk
`Terminating due to java.lang.OutOfMemoryError: Java heap space` langt under limit på 10G.
Dette er en heap-OOM i JVM-en, ikke `OOMKilled` fra Kubernetes.

### Tiltak

Prod (`.skip/prod.yaml`):
- Heap settes via `EXTRA_JAVA_OPTS="-Xms256m -Xmx4g"` (fjernet `-Xmx` fra `JAVA_OPTS`).
- RAM tilbake til request 4G / limit 6G. 8G/10G ble innført mens heapen i praksis var 1G.
  6G limit (~5,59 GiB) gir ~0,8 GiB margin over 4 GiB heap til metaspace/tråder/native minne
  (observert ~0,75 GiB i prod). `-Xmx6g` ville gitt `OOMKilled` i stedet for heap-OOM.

Øvrige miljøer (`.skip/app.yaml`): heap via `EXTRA_JAVA_OPTS="-Xms256m -Xmx{{ maxHeap:-4g }}"`
(6G limit som default). Dev og releasetest har 2G limit og setter `maxHeap: 1g`.
Hold `maxHeap` ~0,8 GiB under `memoryLimit`.

### Videre oppfølging
- Aktivere heap dump (`-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=...`) for å se hva som fyller heapen. Krever skrivbart volum som overlever restart, og analyse i f.eks. Eclipse MAT.
- Hvis tiltakene ikke er tilstrekkelig kan en mulighet være å se på annen konfigurasjon: https://docs.geoserver.org/main/en/user/services/wms/configuration/#wms_configuration_limits
