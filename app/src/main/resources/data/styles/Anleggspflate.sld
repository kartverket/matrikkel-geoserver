<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld"
                       xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

   <NamedLayer>
      <Name>Matrikkelen:AnleggspflateWFS</Name>
      <UserStyle>
         <Name>Style for Anleggsprojeksjonsflater</Name>
         <FeatureTypeStyle>
            <FeatureTypeName>ANLEGGSPFLATEWFS</FeatureTypeName>
            <!--Regel for omriss av flate-->
            <Rule>
               <Title>Omriss av anleggsprojeksjonsflate</Title>
               <MaxScaleDenominator>75000</MaxScaleDenominator>
               <PolygonSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">FLATE</PropertyName>
                  </Geometry>
                  <Fill>
                     <CssParameter name="fill">#e0e0e0</CssParameter>
                     <CssParameter name="opacity">0.5</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#000000</CssParameter>
                     <CssParameter name="stroke-width">0</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <!--Regel for representasjonspunkt og matrikkelnummer-->
            <Rule>
               <Title>Matrikkelnummer og representasjonspunkt for anleggsprojeksjonsflate</Title>
               <MaxScaleDenominator>8000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">REPRESENTASJONSPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>cross</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#320000</CssParameter>
                        </Fill>
                     </Mark>
                     <Size>8.0</Size>
                  </Graphic>
               </PointSymbolizer>
               <TextSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">REPRESENTASJONSPUNKT</PropertyName>
                  </Geometry>
                  <Label>
                     <PropertyName xmlns="http://www.opengis.net/ogc">MATRIKKELNR</PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Noto Sans</CssParameter>
                     <CssParameter name="font-Size">12</CssParameter>
                     <CssParameter name="font-weight">100</CssParameter>
                     <CssParameter name="font-style">normal</CssParameter>
                  </Font>
                  <LabelPlacement>
                     <PointPlacement>
                        <AnchorPoint>
                           <AnchorPointX>0</AnchorPointX>
                           <AnchorPointY>0.8</AnchorPointY>
                        </AnchorPoint>
                        <Displacement>
                           <DisplacementX>6</DisplacementX>
                           <DisplacementY>0</DisplacementY>
                        </Displacement>
                     </PointPlacement>
                  </LabelPlacement>
                  <Fill>
                     <CssParameter name="fill">#320000</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
            </Rule>

            <!-- Regel for skravering av flater over bakken-->
            <Rule>
               <Title>Skravering av anleggsprojeksjonsflater over bakken</Title>
               <MaxScaleDenominator>75000</MaxScaleDenominator>
               <Filter>
                     <PropertyIsEqualTo>
                        <PropertyName>MEDIUM</PropertyName>
                        <Literal>1</Literal>
                     </PropertyIsEqualTo>
               </Filter>
               <PolygonSymbolizer>
                  <Geometry>
                     <PropertyName>FLATE</PropertyName>
                  </Geometry>
                  <Fill>
                     <GraphicFill>
                        <Graphic>
                           <ExternalGraphic>
                              <OnlineResource
                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                    xlink:type="simple"
                                    xlink:href="images/apf_overskravering.png"/>
                              <Format>image/gif</Format>
                           </ExternalGraphic>
                           <Opacity>
                              <Fill>
                                 <CssParameter name="fill-opacity">0.3</CssParameter>
                              </Fill>
                           </Opacity>
                           <Size>32</Size>
                        </Graphic>
                     </GraphicFill>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>

            <!-- Regel for skravering av flater under bakken-->
            <Rule>
               <Title>Skravering av anleggsprojeksjonsflater under bakken</Title>
               <MaxScaleDenominator>75000</MaxScaleDenominator>
               <Filter>
                  <Or>
                     <PropertyIsEqualTo>
                        <PropertyName>MEDIUM</PropertyName>
                        <Literal>6</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName>MEDIUM</PropertyName>
                        <Literal>7</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName>MEDIUM</PropertyName>
                        <Literal>8</Literal>
                     </PropertyIsEqualTo>
                  </Or>
               </Filter>
               <PolygonSymbolizer>
                  <Geometry>
                     <PropertyName>FLATE</PropertyName>
                  </Geometry>
                  <Fill>
                     <GraphicFill>
                        <Graphic>
                           <ExternalGraphic>
                              <OnlineResource
                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                    xlink:type="simple"
                                    xlink:href="images/apf_underskravering.png"/>
                              <Format>image/gif</Format>
                           </ExternalGraphic>
                           <Opacity>
                              <Fill>
                                 <CssParameter name="fill-opacity">0.3</CssParameter>
                              </Fill>
                           </Opacity>
                           <Size>32</Size>
                        </Graphic>
                     </GraphicFill>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>

            <!-- Regel for skravering av flater i vann-->
            <Rule>
               <Title>Skravering av anleggsprojeksjonsflater i vann</Title>
               <MaxScaleDenominator>75000</MaxScaleDenominator>
               <Filter>
                  <Or>
                     <PropertyIsEqualTo>
                        <PropertyName>MEDIUM</PropertyName>
                        <Literal>2</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName>MEDIUM</PropertyName>
                        <Literal>3</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName>MEDIUM</PropertyName>
                        <Literal>4</Literal>
                     </PropertyIsEqualTo>
                     <PropertyIsEqualTo>
                        <PropertyName>MEDIUM</PropertyName>
                        <Literal>5</Literal>
                     </PropertyIsEqualTo>
                  </Or>
               </Filter>
               <PolygonSymbolizer>
                  <Geometry>
                     <PropertyName>FLATE</PropertyName>
                  </Geometry>
                  <Fill>
                     <GraphicFill>
                        <Graphic>
                           <ExternalGraphic>
                              <OnlineResource
                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                    xlink:type="simple"
                                    xlink:href="images/apf_vannskravering.png"/>
                              <Format>image/gif</Format>
                           </ExternalGraphic>
                           <Opacity>
                              <Fill>
                                 <CssParameter name="fill-opacity">0.3</CssParameter>
                              </Fill>
                           </Opacity>
                           <Size>9</Size>
                        </Graphic>
                     </GraphicFill>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>

</StyledLayerDescriptor>