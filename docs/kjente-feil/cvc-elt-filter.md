# cvc-elt.1.a: Cannot find the declaration of element 'Filter'
Feilmelding:
```
cvc-elt.1.a: Cannot find the declaration of element 'Filter'.
```
logger: org.geotools.xsd.impl (nivå WARN)

Dukker opp på WFS 1.1.0 `GetFeature` med `filter=<ogc:Filter xmlns:ogc='http://www.opengis.net/ogc' ...>`.

## Årsak
Ikke feil bruk fra klienten. Requestene har riktig namespace og returnerer `200` med korrekt resultat.
GeoServer parser `filter`-parameteren med en validerende XML-parser mot WFS 1.1.0-skjemaet, som ikke deklarerer `Filter` som rot-element. GeoTools logger derfor en WARN, men parser filteret uansett. Ren logg-støy.

## Tiltak
Meldingen filtreres bort i `app/src/main/resources/data/logs/JSON_STDOUT_LOGGING.xml` med et `RegexFilter` (`onMatch="DENY"`) på `org.geotools.xsd.impl`.

Filteret er bevisst smalt: andre WARN fra `org.geotools.xsd.impl` (andre `cvc-*`-valideringsfeil, GML-/skjemaproblemer) logges fortsatt. Hadde vi satt loggeren til `error`, ville vi mistet disse.

Hvis meldingen dukker opp i en annen form (f.eks. annet element enn `Filter`), må regexen utvides.
