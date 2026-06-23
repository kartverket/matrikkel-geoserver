<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld"
                       xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

   <NamedLayer>
      <Name>Matrikkelen:AtkomstWFS</Name>
      <UserStyle>
         <Name>Style for atkomster</Name>
         <FeatureTypeStyle>
            <Rule>
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <Filter>
                  <PropertyIsEqualTo>
                     <PropertyName>ATKOMSTTYPEKODEID</PropertyName>
                     <Literal>0</Literal><!-- Generell -->
                  </PropertyIsEqualTo>
               </Filter>
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
                     <CssParameter name="fill">#FF66FF</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">ATKOMSTPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>square</WellKnownName>
                        <Stroke>
                           <CssParameter name="stroke">#FF66FF</CssParameter>
                           <CssParameter name="stroke-width">2</CssParameter>
                        </Stroke>
                     </Mark>
                     <Size>8.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <Filter>
                  <PropertyIsEqualTo>
                     <PropertyName>ATKOMSTTYPEKODEID</PropertyName>
                     <Literal>1</Literal><!-- Sommer -->
                  </PropertyIsEqualTo>
               </Filter>
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
                     <CssParameter name="fill">#FF8000</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">ATKOMSTPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>square</WellKnownName>
                        <Stroke>
                           <CssParameter name="stroke">#FF8000</CssParameter>
                           <CssParameter name="stroke-width">2</CssParameter>
                        </Stroke>
                     </Mark>
                     <Size>8.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <Filter>
                  <PropertyIsEqualTo>
                     <PropertyName>ATKOMSTTYPEKODEID</PropertyName>
                     <Literal>2</Literal><!-- Vinter -->
                  </PropertyIsEqualTo>
               </Filter>
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
                     <CssParameter name="fill">#0099FF</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">ATKOMSTPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>square</WellKnownName>
                        <Stroke>
                           <CssParameter name="stroke">#0099FF</CssParameter>
                           <CssParameter name="stroke-width">2</CssParameter>
                        </Stroke>
                     </Mark>
                     <Size>8.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <Filter>
                  <PropertyIsEqualTo>
                     <PropertyName>ATKOMSTTYPEKODEID</PropertyName>
                     <Literal>2</Literal><!-- Nødetat -->
                  </PropertyIsEqualTo>
               </Filter>
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
                     <CssParameter name="fill">#8080FF</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">ATKOMSTPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>square</WellKnownName>
                        <Stroke>
                           <CssParameter name="stroke">#8080FF</CssParameter>
                           <CssParameter name="stroke-width">2</CssParameter>
                        </Stroke>
                     </Mark>
                     <Size>8.0</Size>
                  </Graphic>
               </PointSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>1500</MaxScaleDenominator>
               <Filter>
                  <PropertyIsEqualTo>
                     <PropertyName>ATKOMSTTYPEKODEID</PropertyName>
                     <Literal>2</Literal><!-- Øy -->
                  </PropertyIsEqualTo>
               </Filter>
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
                     <CssParameter name="fill">#8000FF</CssParameter>
                  </Fill>
                  <VendorOption name="group">no</VendorOption>
               </TextSymbolizer>
               <PointSymbolizer>
                  <Geometry>
                     <PropertyName xmlns="http://www.opengis.net/ogc">ATKOMSTPUNKT</PropertyName>
                  </Geometry>
                  <Graphic>
                     <Mark>
                        <WellKnownName>square</WellKnownName>
                        <Stroke>
                           <CssParameter name="stroke">#8000FF</CssParameter>
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