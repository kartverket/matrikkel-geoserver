<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld">
   <Name>SEFRAKMINNEWFS</Name>
   <Title>MatrikkelWFS Sefrakminner Layer</Title>
   <NamedLayer>
      <Name>Style for Sefrakminner</Name>
      <UserStyle>
         <Name>Style for Sefrakminner</Name>
         <FeatureTypeStyle>
            <FeatureTypeName>SEFRAKMINNEWFS</FeatureTypeName>
            <Rule>
               <Title>Sefrakminne revet/utgått bygg</Title><!-- P25_STATUS = 0, grå trekant -->
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <Or>
                     <PropertyIsGreaterThanOrEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">BYGNINGSTATUSKODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">9</Literal>
                     </PropertyIsGreaterThanOrEqualTo>
                     <PropertyIsGreaterThan>
                        <PropertyName xmlns="http://www.opengis.net/ogc">REVETBRENTTIDSKODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">0</Literal>
                     </PropertyIsGreaterThan>
                  </Or>
               </Filter>
               <TextSymbolizer>
                  <Label>
                     <Function name="if_then_else">
                        <Function name="isNull">
                           <PropertyName xmlns="http://www.opengis.net/ogc">KOMMUNENR</PropertyName>
                        </Function>
                        <Literal></Literal>
                        <Function xmlns="http://www.opengis.net/ogc" name="numberFormat">
                           <Literal>0000</Literal>
                           <PropertyName xmlns="http://www.opengis.net/ogc">KOMMUNENR</PropertyName>
                        </Function>
                     </Function><Function name="if_then_else">
                        <Function name="isNull">
                           <PropertyName xmlns="http://www.opengis.net/ogc">REGISTRERINGSKRETSNR</PropertyName>
                        </Function>
                        <Literal></Literal>
                        <Function xmlns="http://www.opengis.net/ogc" name="numberFormat">
                           <Literal>0000</Literal>
                           <PropertyName xmlns="http://www.opengis.net/ogc">REGISTRERINGSKRETSNR</PropertyName>
                        </Function>
                     </Function><Function name="if_then_else">
                        <Function name="isNull">
                           <PropertyName xmlns="http://www.opengis.net/ogc">HUSLOPENR</PropertyName>
                        </Function>
                        <Literal></Literal>
                        <Function xmlns="http://www.opengis.net/ogc" name="numberFormat">
                           <Literal>000</Literal>
                           <PropertyName xmlns="http://www.opengis.net/ogc">HUSLOPENR</PropertyName>
                        </Function>
                     </Function>
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
                           <DisplacementY>6</DisplacementY>
                        </Displacement>
                     </PointPlacement>
                  </LabelPlacement>
                  <Fill>
                     <CssParameter name="fill">#000000</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">REPRESENTASJONSPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>triangle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#969696</CssParameter>
                        </Fill>
                        <Stroke>
                           <CssParameter name="stroke">#000000</CssParameter>
                           <CssParameter name="stroke-width">1</CssParameter>
                        </Stroke>
                     </Mark>
                     <Size>8.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <Rule>
               <Title>Sefrakminne stående bygg, oppført i eller etter 1850</Title><!-- P25_STATUS = 1, gul trekant -->
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsLessThan>
                        <PropertyName xmlns="http://www.opengis.net/ogc">BYGNINGSTATUSKODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">9</Literal>
                     </PropertyIsLessThan>
                     <PropertyIsGreaterThanOrEqualTo>
                        <PropertyName xmlns="http://www.opengis.net/ogc">BYGGETIDSKODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">44</Literal>
                     </PropertyIsGreaterThanOrEqualTo>
                  </And>
               </Filter>
               <TextSymbolizer>
                  <Label>
                     <Function name="if_then_else">
                        <Function name="isNull">
                           <PropertyName xmlns="http://www.opengis.net/ogc">KOMMUNENR</PropertyName>
                        </Function>
                        <Literal></Literal>
                        <Function xmlns="http://www.opengis.net/ogc" name="numberFormat">
                           <Literal>0000</Literal>
                           <PropertyName xmlns="http://www.opengis.net/ogc">KOMMUNENR</PropertyName>
                        </Function>
                     </Function><Function name="if_then_else">
                        <Function name="isNull">
                           <PropertyName xmlns="http://www.opengis.net/ogc">REGISTRERINGSKRETSNR</PropertyName>
                        </Function>
                        <Literal></Literal>
                        <Function xmlns="http://www.opengis.net/ogc" name="numberFormat">
                           <Literal>0000</Literal>
                           <PropertyName xmlns="http://www.opengis.net/ogc">REGISTRERINGSKRETSNR</PropertyName>
                        </Function>
                     </Function><Function name="if_then_else">
                        <Function name="isNull">
                           <PropertyName xmlns="http://www.opengis.net/ogc">HUSLOPENR</PropertyName>
                        </Function>
                        <Literal></Literal>
                        <Function xmlns="http://www.opengis.net/ogc" name="numberFormat">
                           <Literal>000</Literal>
                           <PropertyName xmlns="http://www.opengis.net/ogc">HUSLOPENR</PropertyName>
                        </Function>
                     </Function>
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
                           <DisplacementY>6</DisplacementY>
                        </Displacement>
                     </PointPlacement>
                  </LabelPlacement>
                  <Fill>
                     <CssParameter name="fill">#000000</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">REPRESENTASJONSPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>triangle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#ffff00</CssParameter>
                        </Fill>
                        <Stroke>
                           <CssParameter name="stroke">#000000</CssParameter>
                           <CssParameter name="stroke-width">1</CssParameter>
                        </Stroke>
                     </Mark>
                     <Size>8.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <Rule>
               <Title>Sefrakminne stående bygg, oppført før 1850 eller mangler datering</Title><!-- P25_STATUS = 2, rød trekant -->
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <Filter xmlns="http://www.opengis.net/ogc">
                  <And>
                     <PropertyIsLessThan>
                        <PropertyName xmlns="http://www.opengis.net/ogc">BYGNINGSTATUSKODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">9</Literal>
                     </PropertyIsLessThan>
                     <PropertyIsLessThan>
                        <PropertyName xmlns="http://www.opengis.net/ogc">BYGGETIDSKODE</PropertyName>
                        <Literal xmlns="http://www.opengis.net/ogc">44</Literal>
                     </PropertyIsLessThan>
                  </And>
               </Filter>
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <TextSymbolizer>
                  <Label>
                     <Function name="if_then_else">
                        <Function name="isNull">
                           <PropertyName xmlns="http://www.opengis.net/ogc">KOMMUNENR</PropertyName>
                        </Function>
                        <Literal></Literal>
                        <Function xmlns="http://www.opengis.net/ogc" name="numberFormat">
                           <Literal>0000</Literal>
                           <PropertyName xmlns="http://www.opengis.net/ogc">KOMMUNENR</PropertyName>
                        </Function>
                     </Function><Function name="if_then_else">
                        <Function name="isNull">
                           <PropertyName xmlns="http://www.opengis.net/ogc">REGISTRERINGSKRETSNR</PropertyName>
                        </Function>
                        <Literal></Literal>
                        <Function xmlns="http://www.opengis.net/ogc" name="numberFormat">
                           <Literal>0000</Literal>
                           <PropertyName xmlns="http://www.opengis.net/ogc">REGISTRERINGSKRETSNR</PropertyName>
                        </Function>
                     </Function><Function name="if_then_else">
                        <Function name="isNull">
                           <PropertyName xmlns="http://www.opengis.net/ogc">HUSLOPENR</PropertyName>
                        </Function>
                        <Literal></Literal>
                        <Function xmlns="http://www.opengis.net/ogc" name="numberFormat">
                           <Literal>000</Literal>
                           <PropertyName xmlns="http://www.opengis.net/ogc">HUSLOPENR</PropertyName>
                        </Function>
                     </Function>
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
                           <DisplacementY>6</DisplacementY>
                        </Displacement>
                     </PointPlacement>
                  </LabelPlacement>
                  <Fill>
                     <CssParameter name="fill">#000000</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">REPRESENTASJONSPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>triangle</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#ff0000</CssParameter>
                        </Fill>
                        <Stroke>
                           <CssParameter name="stroke">#000000</CssParameter>
                           <CssParameter name="stroke-width">1</CssParameter>
                        </Stroke>
                     </Mark>
                     <Size>8.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <!-- Rule for å hindre at det blir lagt til where filter for sld-filtre -->
            <Rule>
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <!-- Title>Sefrakminne optimalisering</Title -->
               <ElseFilter xmlns="http://www.opengis.net/ogc">
               </ElseFilter>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>

</StyledLayerDescriptor>