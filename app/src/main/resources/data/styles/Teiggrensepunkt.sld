<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld"
                       xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

   <Name>Matrikkelen:TeiggrensepunktWFS</Name>
   <Title>MatrikkelWFS Teiggrensepunkt Layer</Title>
   <Abstract>Punkt for Teiggrensepunkt.</Abstract>
   <NamedLayer>
      <Name>Style for Teiggrensepunkt</Name>
      <UserStyle>
         <Name>Style for Teiggrensepunkt</Name>
         <FeatureTypeStyle>
            <FeatureTypeName>TEIGGRENSEPUNKTWFS</FeatureTypeName>
            <!--Nøyaktighet <= 10 cm OG målemetode ikke lik IngenVerdi (62)-->
            <Rule>
               <Title>Teiggrensepunkter med nøyaktighet bedre enn 10cm og ukjent målemetode</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                  <PropertyIsLessThanOrEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHET</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">10</Literal>
                  </PropertyIsLessThanOrEqualTo>
                  <PropertyIsNotEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">62</Literal>
                  </PropertyIsNotEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>circle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#00ff00</CssParameter>
                        </Fill>
                     </Mark>
                     <Size>6.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <!--Nøyaktighet > 10 cm OG Nøyaktighet <= 30 cm OG målemetode ikke lik IngenVerdi (62)-->
            <Rule>
               <Title>Teiggrensepunkter med nøyaktighet mellom 10 og 30 cm og ukjent målemetode</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsGreaterThan>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">10</Literal>
                     </PropertyIsGreaterThan>
                     <PropertyIsLessThanOrEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">30</Literal>
                     </PropertyIsLessThanOrEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">62</Literal>
                     </PropertyIsNotEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>circle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#00bf40</CssParameter>
                        </Fill>
                     </Mark>
                     <Size>6.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <!--Nøyaktighet > 30 cm OG Nøyaktighet < 200 cm OG målemetode ikke lik IngenVerdi (62)-->
            <Rule>
               <Title>Teiggrensepunkter med nøyaktighet mellom 30 og 200 cm og ukjent målemetode</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsGreaterThan>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">30</Literal>
                     </PropertyIsGreaterThan>
                     <PropertyIsLessThan>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">200</Literal>
                     </PropertyIsLessThan>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">62</Literal>
                     </PropertyIsNotEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>circle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#7f00ff</CssParameter>
                        </Fill>
                     </Mark>
                     <Size>6.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <!--Nøyaktighet >= 200 cm OG Nøyaktighet < 500 cm OG målemetode ikke lik IngenVerdi (62)-->
            <Rule>
               <Title>Teiggrensepunkter med nøyaktighet mellom 200 og 500 cm og ukjent målemetode</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsGreaterThanOrEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">200</Literal>
                     </PropertyIsGreaterThanOrEqualTo>
                     <PropertyIsLessThan>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">500</Literal>
                     </PropertyIsLessThan>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">62</Literal>
                     </PropertyIsNotEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>circle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#e000e0</CssParameter>
                        </Fill>
                     </Mark>
                     <Size>6.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <!--Nøyaktighet >= 500 cm OG målemetode er Frihånd(51,52,53) - ELLER målemetode lik IngenVerdi (62)-->
            <Rule>
               <Title>Teiggrensepunkter med nøyaktighet dårligere enn 500 cm og frihånd eller ukjent målemetode</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <Or>
                     <And>
                        <PropertyIsGreaterThanOrEqualTo>
                           <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHET</PropertyName>
                           <Literal xmlns="http://www.opengis.net/ogc">500</Literal>
                        </PropertyIsGreaterThanOrEqualTo>
                        <Or>
                           <PropertyIsEqualTo>
                              <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                              <Literal xmlns="http://www.opengis.net/ogc">51</Literal>
                           </PropertyIsEqualTo>
                           <PropertyIsEqualTo>
                              <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                              <Literal xmlns="http://www.opengis.net/ogc">52</Literal>
                           </PropertyIsEqualTo>
                           <PropertyIsEqualTo>
                              <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                              <Literal xmlns="http://www.opengis.net/ogc">53</Literal>
                           </PropertyIsEqualTo>
                        </Or>
                     </And>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">62</Literal>
                     </PropertyIsEqualTo>
                  </Or>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>circle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#ff0000</CssParameter>
                        </Fill>
                     </Mark>
                     <Size>6.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <!--Nøyaktighet >= 500 cm OG målemetode er ikke Frihånd(51,52,53) OG målemetode er ikke IngenVerdi (62)-->
            <Rule>
               <Title>Teiggrensepunkter med nøyaktighet dårligere enn 500 cm og annen målemetode enn frihånd og ukjent</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsGreaterThanOrEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">NOYAKTIGHET</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">500</Literal>
                     </PropertyIsGreaterThanOrEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">51</Literal>
                     </PropertyIsNotEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">52</Literal>
                     </PropertyIsNotEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">53</Literal>
                     </PropertyIsNotEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">MALEMETODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">62</Literal>
                     </PropertyIsNotEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>circle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#ff8000</CssParameter>
                        </Fill>
                     </Mark>
                     <Size>6.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>

            <!--Røys [0, 4050], [7, 4055], [14, 4063] (er faktisk Grensestein)-->
            <Rule>
               <Title>Teiggrensepunkter av type riksgrensemerke, grensestein eller stein med kors </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <Or>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">7</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">14</Literal>
                     </PropertyIsEqualTo>
                  </Or>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <ExternalGraphic>
                        <OnlineResource
                              xmlns:xlink="http://www.w3.org/1999/xlink"
                              xlink:type="simple"
                              xlink:href="images/roys.gif"/>
                        <Format>image/gif</Format>
                     </ExternalGraphic>
                     <Mark/>
                     <Size>12.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>

            <!--Bolt [4, 4052]-->
            <Rule>
               <Title>Teiggrensepunkter av type bolt </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">4</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <ExternalGraphic>
                        <OnlineResource
                              xmlns:xlink="http://www.w3.org/1999/xlink"
                              xlink:type="simple"
                              xlink:href="images/bolt.gif"/>
                        <Format>image/gif</Format>
                     </ExternalGraphic>
                     <Mark/>
                     <Size>12.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>

            <!--Kors [5, 4053]-->
            <Rule>
               <Title>Teiggrensepunkter av type kors </Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">5</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <ExternalGraphic>
                        <OnlineResource
                              xmlns:xlink="http://www.w3.org/1999/xlink"
                              xlink:type="simple"
                              xlink:href="images/kors.gif"/>
                        <Format>image/gif</Format>
                     </ExternalGraphic>
                     <Mark/>
                     <Size>12.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>

            <!--OffGodkjent [3, 4051]-->
            <Rule>
               <Title>Teiggrensepunkter av type offentlig godkjent grensemerke</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <PropertyIsEqualTo>
                     <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                     <Literal xmlns="http://www.opengis.net/ogc">3</Literal>
                  </PropertyIsEqualTo>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <ExternalGraphic>
                        <OnlineResource
                              xmlns:xlink="http://www.w3.org/1999/xlink"
                              xlink:type="simple"
                              xlink:href="images/offgodkjent.gif"/>
                        <Format>image/gif</Format>
                     </ExternalGraphic>
                     <Mark/>
                     <Size>12.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>

            <!--Litenprikk -->
            <Rule>
               <Title>Teiggrensepunkter av type annen detalj, midt eller djupålen i elv eller bekk eller umerket</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsGreaterThan>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">16</Literal>
                     </PropertyIsGreaterThan>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">19</Literal>
                     </PropertyIsNotEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">20</Literal>
                     </PropertyIsNotEqualTo>
                     <PropertyIsNotEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">23</Literal>
                     </PropertyIsNotEqualTo>
                  </And>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <ExternalGraphic>
                        <OnlineResource
                              xmlns:xlink="http://www.w3.org/1999/xlink"
                              xlink:type="simple"
                              xlink:href="images/litenprikk.gif"/>
                        <Format>image/gif</Format>
                     </ExternalGraphic>
                     <Mark/>
                     <Size>12.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>

            <!--Prikk (4054, 4056-4062, 4064-4071, 4074-4076, 4079-4080, 4082-4083, 4086-4088)-->
            <Rule>
               <Title>Teiggrensepunkter med generell opptegning basert på type</Title>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <Or>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">1</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">2</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">23</Literal>
                     </PropertyIsEqualTo>
                     <And>
                        <PropertyIsGreaterThan>
                           <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                           <Literal xmlns="http://www.opengis.net/ogc">5</Literal>
                        </PropertyIsGreaterThan>
                        <PropertyIsLessThan>
                           <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                           <Literal xmlns="http://www.opengis.net/ogc">21</Literal>
                        </PropertyIsLessThan>
                        <PropertyIsNotEqualTo>
                           <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                           <Literal xmlns="http://www.opengis.net/ogc">7</Literal>
                        </PropertyIsNotEqualTo>
                        <PropertyIsNotEqualTo>
                           <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                           <Literal xmlns="http://www.opengis.net/ogc">14</Literal>
                        </PropertyIsNotEqualTo>
                        <PropertyIsNotEqualTo>
                           <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                           <Literal xmlns="http://www.opengis.net/ogc">17</Literal>
                        </PropertyIsNotEqualTo>
                        <PropertyIsNotEqualTo>
                           <PropertyName xmlns="http://www.opengis.net/ogc">GRENSEPUNKTTYPE</PropertyName>
                           <Literal xmlns="http://www.opengis.net/ogc">18</Literal>
                        </PropertyIsNotEqualTo>
                     </And>
                  </Or>
               </Filter>
               <MaxScaleDenominator>1000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">PUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <ExternalGraphic>
                        <OnlineResource
                              xmlns:xlink="http://www.w3.org/1999/xlink"
                              xlink:type="simple"
                              xlink:href="images/prikk.gif"/>
                        <Format>image/gif</Format>
                     </ExternalGraphic>
                     <Mark/>
                     <Size>12.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>

         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>

</StyledLayerDescriptor>
