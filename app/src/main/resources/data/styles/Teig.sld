<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld"
                       xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

   <NamedLayer>
      <Name>Matrikkelen:TeigWFS</Name>
      <UserStyle>
         <Name>Style for Teiger</Name>
         <FeatureTypeStyle>
            <FeatureTypeName>TEIGWFS</FeatureTypeName>
            <!--Regel for omriss av flate-->
            <Rule>
               <Title>Omriss av teiger</Title>
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
               <Title>Matrikkelnummer og representasjonspunkt for teiger</Title>
               <MaxScaleDenominator>8000</MaxScaleDenominator>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">REPRESENTASJONSPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>cross</WellKnownName>
                        <Fill>
                           <CssParameter name="fill">#ff0000</CssParameter>
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
                     <CssParameter name="fill">#ff0000</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>

            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>

</StyledLayerDescriptor>