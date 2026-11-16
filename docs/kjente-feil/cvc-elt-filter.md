# cvc-elt.1.a: Cannot find the declaration of element 'Filter'
Feilmelding:
```
cvc-elt.1.a: Cannot find the declaration of element 'Filter'.
```
logger: org.geotools.xsd.impl (nivå WARN)

Dukker opp på WFS 1.1.0 `GetFeature` med `filter=<ogc:Filter xmlns:ogc='http://www.opengis.net/ogc' ...>`.

## Årsak
Ikke feil bruk fra klienten. Requestene har riktig namespace og returnerer `200` med korrekt resultat.
GeoServer prøver filteret mot flere parsere i fast rekkefølge: FES 2.0 (`http://www.opengis.net/fes/2.0`), deretter OGC Filter 1.0, deretter 1.1, og til slutt en gammel parser (se `FilterKvpParser` i GeoServer, WMS-varianten; WFS antas å ha samme mønster).
Klienten bruker `http://www.opengis.net/ogc`, så første forsøk (FES 2.0) feiler med `cvc-elt.1.a` og logges som WARN, før neste parser lykkes. Ren logg-støy.

Alternativ til logg-filter: klienten kan bruke FES 2.0-namespace (krever WFS 2.0-syntaks), da lykkes første forsøk og meldingen uteblir.

## Tiltak
Meldingen filtreres bort i `app/src/main/resources/data/logs/JSON_STDOUT_LOGGING.xml` med et `RegexFilter` (`onMatch="DENY"`) på `org.geotools.xsd.impl`.

Filteret er bevisst smalt: andre WARN fra `org.geotools.xsd.impl` (andre `cvc-*`-valideringsfeil, GML-/skjemaproblemer) logges fortsatt. Hadde vi satt loggeren til `error`, ville vi mistet disse.

Hvis meldingen dukker opp i en annen form (f.eks. annet element enn `Filter`), må regexen utvides.
