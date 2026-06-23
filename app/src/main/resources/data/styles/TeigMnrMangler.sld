<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld"
                       xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

   <NamedLayer>
      <Name>Matrikkelen:TeigWFS</Name>
      <UserStyle>
         <Name>Style for teiger som hører til matrikkelenheter hvor matrikkelnummer mangler</Name>
         <FeatureTypeStyle>
            <FeatureTypeName>TEIGWFS</FeatureTypeName>
            <!--Regel for omriss av flate-->

            <Rule>
               <Title>Omriss av teiger hvor matrikkelnummer mangler</Title>
               <!--Tegner eierløse teiger lysrøde, litt mørkere enn krysset for festegrunner -->
               <Filter xmlns="http://www.opengis.net/ogc">
                   <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GARDSNR</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">BRUKSNR</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                   </And>
               </Filter>
               <MaxScaleDenominator>75000</MaxScaleDenominator>
               <PolygonSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">FLATE</PropertyName>
                  </Geometry>
                  <Fill>
                     <CssParameter name="fill">#ff4f4f</CssParameter>
                     <CssParameter name="opacity">0.5</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#000000</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>

            <Rule>
               <Title>Omriss av vannteiger hvor matrikkelnummer mangler</Title>
               <!--Tegner vannteiger blå, litt lysere enn adressefirkant -->
               <Filter xmlns="http://www.opengis.net/ogc">
                   <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GARDSNR</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">BRUKSNR</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsEqualTo>
                   </And>
               </Filter>
               <MaxScaleDenominator>75000</MaxScaleDenominator>
               <PolygonSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">FLATE</PropertyName>
                  </Geometry>
                  <Fill>
                     <CssParameter name="fill">#80e9ff</CssParameter>
                     <CssParameter name="opacity">0.5</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#000000</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>

         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>

</StyledLayerDescriptor>