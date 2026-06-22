<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld"
                       xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

   <Name>Matrikkelen:GateadresseWFS</Name>
   <Title>MatrikkelWFS Gateadresse Layer</Title>
   <Abstract>Punkt for Gateadresse.</Abstract>
   <NamedLayer>
      <Name>Style for Gateadresser</Name>
      <UserStyle>
         <FeatureTypeStyle>
            <FeatureTypeName>GATEADRESSEWFS</FeatureTypeName>
            <Rule>
               <Title>Representasjonspunkt for Gateadresse</Title>
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <TextSymbolizer>
                  <Label>
                     <PropertyName xmlns="http://www.opengis.net/ogc">ADRESSETEKST</PropertyName>
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
                           <DisplacementY>-6</DisplacementY>
                        </Displacement>
                     </PointPlacement>
                  </LabelPlacement>
                  <Fill>
                     <CssParameter name="fill">#0000ff</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">REPRESENTASJONSPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>square</WellKnownName>
                        <Stroke>
                           <CssParameter name="stroke">#0000ff</CssParameter>
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