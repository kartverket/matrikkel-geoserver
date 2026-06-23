<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld"
                       xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

   <Name>Matrikkelen:AnleggspgrenseWFS</Name>
   <Title>MatrikkelWFS Anleggspgrense Layer</Title>
   <Abstract>Kurve for Anleggspgrense.</Abstract>
   <NamedLayer>
      <Name>Matrikkelen:AnleggspgrenseWFS</Name>
      <UserStyle>
         <Name>Style for Anleggsprojeksjonsgrenser</Name>
         <FeatureTypeStyle>
            <FeatureTypeName>ANLEGGSPGRENSEWFS</FeatureTypeName>
            <Rule>
               <Title>Anleggsprojeksjonsgrenser med nøyaktighet bedre enn 10cm </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#00ff00</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>
            <Rule>
               <Title>Anleggsprojeksjonsgrenser med nøyaktighet mellom 10 og 30cm </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#00bf40</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <Rule>
               <Title>Anleggsprojeksjonsgrenser med nøyaktighet mellom 30 og 200cm </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">2</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#7f00ff</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <Rule>
               <Title>Anleggsprojeksjonsgrenser med nøyaktighet mellom 200 og 500cm </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">3</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#e000e0</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <Rule>
               <Title>Anleggsprojeksjonsgrenser med Skissenøyaktighet eller ikke angitt nøyaktighet </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <Or>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">4</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">6</Literal>
                     </PropertyIsEqualTo>
                  </Or>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#ff0000</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <Rule>
               <Title>Anleggsprojeksjonsgrenser med nøyaktighet for Norge 1:50000 </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">5</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#ff8000</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>

</StyledLayerDescriptor>