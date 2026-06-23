<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
                       xmlns="http://www.opengis.net/sld"
                       xmlns:xlink="http://www.w3.org/1999/xlink"
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

   <NamedLayer>
      <Name>Matrikkelen:KretsWFS</Name>
      <UserStyle>
         <Name>Style for Kretser</Name>
         <FeatureTypeStyle>
            <FeatureTypeName>KretsWFS</FeatureTypeName>
            <!--Regel for omriss av flate-->
            <Rule>
               <Title>Omriss av kretser</Title>
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
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>