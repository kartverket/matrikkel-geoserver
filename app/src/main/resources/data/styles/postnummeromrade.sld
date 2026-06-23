<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld"
                       xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

   <NamedLayer>
      <Name>Matrikkelen:PostnummeromradeWFS</Name>
      <UserStyle>
         <Name>Style for Postnummerområder</Name>
         <FeatureTypeStyle>
            <FeatureTypeName>PostnummeromradeWFS</FeatureTypeName>

            <Rule>
               <Title>Postnummeromrade</Title>
               <PolygonSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">FLATE</PropertyName>
                  </Geometry>
                  <Stroke>
                     <CssParameter name="stroke">#E000E0</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
               <PointSymbolizer>
                  <Geometry>
                     <Function xmlns="http://www.opengis.net/ogc" name="centroid">
                        <PropertyName xmlns="http://www.opengis.net/ogc">FLATE</PropertyName>
                     </Function>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>square</WellKnownName>
                        <!-- <Stroke>
                           <CssParameter name="stroke">#0000FF</CssParameter>
                           <CssParameter name="stroke-width">2</CssParameter>
                        </Stroke> -->
                        <Fill>
                           <CssParameter name="fill">#E000E0</CssParameter>
                        </Fill>
                     </Mark>
                     <Size>8.0</Size>
                  </Graphic>
               </PointSymbolizer>
               <TextSymbolizer>
                  <Geometry>
                     <Function xmlns="http://www.opengis.net/ogc" name="centroid">
                        <PropertyName xmlns="http://www.opengis.net/ogc">FLATE</PropertyName>
                     </Function>
                  </Geometry>
                  <Label>
                     <Function name="if_then_else">
                        <Function name="isNull">
                           <PropertyName xmlns="http://www.opengis.net/ogc">KRETSNR</PropertyName>
                        </Function>
                        <Literal></Literal>
                        <Function name="numberFormat">
                           <Literal xmlns="http://www.opengis.net/ogc">0000</Literal>
                           <PropertyName xmlns="http://www.opengis.net/ogc">KRETSNR</PropertyName>
                        </Function>
                     </Function>
                     <PropertyName xmlns="http://www.opengis.net/ogc">KRETSNAVN</PropertyName>
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
                           <AnchorPointY>0.6</AnchorPointY>
                        </AnchorPoint>
                        <Displacement>
                           <DisplacementX>6</DisplacementX>
                           <DisplacementY>0</DisplacementY>
                        </Displacement>
                     </PointPlacement>
                  </LabelPlacement>
                  <Fill>
                     <CssParameter name="fill">#E000E0</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
            </Rule>

         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>