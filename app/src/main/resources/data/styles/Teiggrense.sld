<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld"
                       xmlns:xlink="http://www.w3.org/TR/xlink/"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

   <Name>Matrikkelen:TeiggrenseWFS</Name>
   <Title>MatrikkelWFS Teiggrense Layer</Title>
   <Abstract>Kurve for Teiggrense.</Abstract>
   <NamedLayer>
      <Name>Matrikkelen:TeiggrenseWFS</Name>
      <UserStyle>
         <Name>Style for Teiggrenser</Name>
         <FeatureTypeStyle>
            <FeatureTypeName>TEIGGRENSEWFS</FeatureTypeName>
            <!--Regler for å tegne vanlige Teiggrenser-->
            <Rule>
               <Title>Teiggrenser med nøyaktighet bedre enn 10cm </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">TEIGGRENSETYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsNotEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                  </And>
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
               <Title>Teiggrenser med nøyaktighet mellom 10 og 30cm </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">TEIGGRENSETYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsNotEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsEqualTo>
                  </And>
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
               <Title>Teiggrenser med nøyaktighet mellom 30 og 200cm </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">TEIGGRENSETYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsNotEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">2</Literal>
                     </PropertyIsEqualTo>
                  </And>
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
               <Title>Teiggrenser med nøyaktighet mellom 200 og 500cm </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">TEIGGRENSETYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsNotEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">3</Literal>
                     </PropertyIsEqualTo>
                  </And>
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
               <Title>Teiggrenser med Skissenøyaktighet eller ikke angitt nøyaktighet </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">TEIGGRENSETYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsNotEqualTo>
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
                  </And>
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
               <Title>Teiggrenser med nøyaktighet for Norge 1:50000 </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">TEIGGRENSETYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsNotEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">5</Literal>
                     </PropertyIsEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#ff8000</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <!--Regler for å tegne Teiggrenser av teiggrenseType vannkant-->
            <Rule>
               <Title>Teiggrenser av type vannkant </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">TEIGGRENSETYPE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#0000ff</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                     <CssParameter name="stroke-dasharray">8.0 2.0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <!--Regler for å tegne genererte Teiggrenser (vegkant)-->
            <Rule>
               <Title>Teiggrenser av type vegkant </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">TEIGGRENSETYPE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">2</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#808080</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                     <CssParameter name="stroke-dasharray">8.0 2.0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <!--Regler for å tegne fiktive Teiggrenser-->
            <Rule>
               <Title>Fiktive teiggrenser </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">TEIGGRENSETYPE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">3</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#808080</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                     <CssParameter name="stroke-dasharray">2.0 3.0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <!--Regler for å tegne fiktive Teiggrenser for punktfeste-->
            <Rule>
               <Title>Teiggrenser for punktfeste </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">TEIGGRENSETYPE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">4</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#808080</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                     <CssParameter name="stroke-dasharray">1.0 3.0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <!--Regler for å tegne omtvistede Teiggrenser-->
            <Rule>
               <Title>Omtvistede teigggrenser med nøyaktighet bedre enn 10cm</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#00ff00</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                     <CssParameter name="stroke-dasharray">16.0 4.0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>
            <Rule>
               <Title>Omtvistede teigggrenser med nøyaktighet mellom 10 og 30cm</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#00bf40</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                     <CssParameter name="stroke-dasharray">16.0 4.0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <Rule>
               <Title>Omtvistede teigggrenser med nøyaktighet mellom 30 og 200cm</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">2</Literal>
                     </PropertyIsEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#7f00ff</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                     <CssParameter name="stroke-dasharray">16.0 4.0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <Rule>
               <Title>Omtvistede teigggrenser med nøyaktighet mellom 200 og 500cm</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">3</Literal>
                     </PropertyIsEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#e000e0</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                     <CssParameter name="stroke-dasharray">16.0 4.0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <Rule>
               <Title>Omtvistede teiggrenser med Skissenøyaktighet eller ikke angitt nøyaktighet </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsEqualTo>
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
                  </And>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#ff0000</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                     <CssParameter name="stroke-dasharray">16.0 4.0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>

            <Rule>
               <Title>Omtvistede teiggrenser med nøyaktighet for Norge 1:50000 </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">OMTVISTET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHETSKLASSE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">5</Literal>
                     </PropertyIsEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>4000</MaxScaleDenominator>
               <LineSymbolizer>
                  <Stroke>
                     <CssParameter name="stroke">#ff8000</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                     <CssParameter name="stroke-dasharray">16.0 4.0</CssParameter>
                  </Stroke>
               </LineSymbolizer>
            </Rule>


         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>

</StyledLayerDescriptor>