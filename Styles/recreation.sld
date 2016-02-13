<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:se="http://www.opengis.net/se">
  <NamedLayer>
    <se:Name>Recreation</se:Name>
    <UserStyle>
      <se:Name>Recreation</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>ATV Trail</se:Name>
          <se:Description>
            <se:Title>ATV Trail</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'ATV Trail'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="ATVTrail.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Bicycle Trail</se:Name>
          <se:Description>
            <se:Title>Bicycle Trail</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Bicycle Trail'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="MountainBiking.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Boat Dock</se:Name>
          <se:Description>
            <se:Title>Boat Dock</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Boat Dock'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="BoatDock.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Camp Site</se:Name>
          <se:Description>
            <se:Title>Camp Site</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Camp Site'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>circle</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="gpsicons/teepee.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>6</se:Size>
              <se:Displacement>
                <se:DisplacementX>-0.2</se:DisplacementX>
                <se:DisplacementY>-0.4</se:DisplacementY>
              </se:Displacement>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Fire Ring</se:Name>
          <se:Description>
            <se:Title>Fire Ring</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Fire Ring'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>circle</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>7</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="amenity/amenity_firestation.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>6</se:Size>
              <se:Displacement>
                <se:DisplacementX>0</se:DisplacementX>
                <se:DisplacementY>-0.2</se:DisplacementY>
              </se:Displacement>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Fishing</se:Name>
          <se:Description>
            <se:Title>Fishing</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Fishing'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="Fishing.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Horseback Riding</se:Name>
          <se:Description>
            <se:Title>Horseback Riding</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Horseback Riding'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="HorsebackRidingTrail.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Hunting Stand</se:Name>
          <se:Description>
            <se:Title>Hunting Stand</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Hunting Stand'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="ViewingPlatform.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Picnic Area</se:Name>
          <se:Description>
            <se:Title>Picnic Area</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Picnic Area'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>circle</se:WellKnownName>
                <se:Fill>
                  <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
                </se:Fill>
                <se:Stroke>
                  <se:SvgParameter name="stroke">#000000</se:SvgParameter>
                </se:Stroke>
              </se:Mark>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="tourist/tourist_picnic.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>6</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Point of Interest</se:Name>
          <se:Description>
            <se:Title>Point of Interest</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Point of Interest'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="PointOfInterest.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Scenic Viewpoint</se:Name>
          <se:Description>
            <se:Title>Scenic Viewpoint</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Scenic Viewpoint'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="ViewPoint.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Shelter</se:Name>
          <se:Description>
            <se:Title>Shelter</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Shelter'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="LeanToThree.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Wildlife Viewing</se:Name>
          <se:Description>
            <se:Title>Wildlife Viewing</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Wildlife Viewing'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="DeerViewing.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Unknown</se:Name>
          <se:Description>
            <se:Title>Unknown</se:Title>
          </se:Description>
          <!--Parser Error: syntax error, unexpected COLUMN_REF, expecting $end - Expression was: Recreation Types_rectype_dsc = 'Unknown'-->
          <se:PointSymbolizer>
            <se:Graphic>
              <se:ExternalGraphic>
                <se:OnlineResource xlink:type="simple" xlink:href="Unknown.svg"/>
                <se:Format>image/svg+xml</se:Format>
              </se:ExternalGraphic>
              <se:Size>8</se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
