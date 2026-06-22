<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld"
                       xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

   <Name>Matrikkelen:MatrikkeladresseWFS</Name>
   <Title>MatrikkelWFS Matrikkeladresse Layer</Title>
   <Abstract>Punkt for Matrikkeladresser.</Abstract>
   <NamedLayer>
      <Name>Style for Matrikkeladresser</Name>
      <UserStyle>
         <Name>Style for Matrikkeladresser</Name>
         <FeatureTypeStyle>
            <FeatureTypeName>MATRIKKELADRESSEWFS</FeatureTypeName>
            <Rule>
               <Title>Representasjonspunkt for Matrikkeladresser</Title>
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <TextSymbolizer>
                  <Label>
                     <PropertyName xmlns="http://www.opengis.net/ogc">ADRESSETEKST</PropertyName>
                  </Label>
                  <Font>
                     <CssParameter name="font-family">Noto Sans</CssParameter>
                     <CssParameter name="font-Size">12</CssParameter>
                  </Font>

                  <LabelPlacement>
                     <PointPlacement>
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