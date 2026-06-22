<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld">
   <Name>BYGNINGWFS</Name>
   <Title>MatrikkelWFS Bygninger Layer</Title>
   <NamedLayer>
      <Name>Style for Bygninger</Name>
      <UserStyle>
         <Name>Style for Bygninger</Name>
         <FeatureTypeStyle>
            <FeatureTypeName>BYGNINGWFS</FeatureTypeName>
            <Rule>
               <Title>Representasjonspunkt for bygg</Title>
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <TextSymbolizer>
                  <Label>                     
                     <PropertyName xmlns="http://www.opengis.net/ogc">BYGNINGSNR</PropertyName>
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
                     <CssParameter name="fill">#ff0000</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">REPRESENTASJONSPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>circle</WellKnownName>
                        <Stroke>
                           <CssParameter name="stroke">#00ff00</CssParameter>
                           <CssParameter name="stroke-width">2</CssParameter>
                        </Stroke>
                     </Mark>
                     <Size>8.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>

</StyledLayerDescriptor>