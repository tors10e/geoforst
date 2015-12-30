from django.contrib.gis.forms.widgets import BaseGeometryWidget

class GeowebOpenLayersWidget(BaseGeometryWidget):
    template_name = 'mapping/openlayers.html'

    class Media:
        js = (
            '/static/openlayers/OpenLayers-2.13.1/OpenLayers.js',
            '/static/geoweb/js/BingMapWidget.js',
        )
