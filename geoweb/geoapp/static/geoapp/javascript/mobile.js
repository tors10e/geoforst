// initialize map when page ready
var map;
var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";

// Get rid of address bar on iphone/ipod
var fixSize = function() {
    window.scrollTo(0,0);
    document.body.style.height = '100%';
    if (!(/(iphone|ipod)/.test(navigator.userAgent.toLowerCase()))) {
        if (document.body.parentNode) {
            document.body.parentNode.style.height = '100%';
        }
    }
};
setTimeout(fixSize, 700);
setTimeout(fixSize, 1500);

var init = function () {
    // create map
    map = new OpenLayers.Map({
        div: "map",
        theme: null,
        controls: [
            new OpenLayers.Control.Attribution(),
            new OpenLayers.Control.TouchNavigation({
                dragPanOptions: {
                    enableKinetic: true
                }
            }),
            new OpenLayers.Control.Zoom(),
            new OpenLayers.Control.LayerSwitcher({})
        ]
    });
    
    
    //Bing layers
    var bing_road = new OpenLayers.Layer.Bing({
        name: "Road",
        key: apiKey,
        type: "Road"
    });
    
    var bing_hybrid = new OpenLayers.Layer.Bing({
        name: "Hybrid",
        key: apiKey,
        type: "AerialWithLabels"
    });
    
    var bing_aerial = new OpenLayers.Layer.Bing({
        name: "Aerial",
        key: apiKey,
        type: "Aerial"
    });
    
    // WMS Layers.
    format = "image/png";
 	var fire_management = new OpenLayers.Layer.WMS(
            "Fire Management", 
            "http://geoforst.com:8082/geoserver/geoforst/wms",
            {
                LAYERS: 'fire_management',
                STYLES: '',
                format: format,
                transparent: "true",
                projection: new OpenLayers.Projection('EPSG:3857')
            },
            {
                buffer: 0,
                displayOutsideMaxExtent: "false",
                isBaseLayer: false,
             	  yx : {'EPSG:4326' : false}
            } 
        );
      
	 	var recreation = new OpenLayers.Layer.WMS(
                "Recreation", 
                "http://geoforst.com:8082/geoserver/geoforst/wms",
                {
                    LAYERS: 'recreation',
                    STYLES: '',
                    format: format,
                    transparent: "true",
                    projection: new OpenLayers.Projection('EPSG:3857')
                },
                {
                    buffer: 0,
                    displayOutsideMaxExtent: "false",
                    isBaseLayer: false,
                 	  yx : {'EPSG:4326' : false}
                } 
            );
          
	 	
	 	var wms_tiled = new OpenLayers.Layer.WMS(
            "Base Layers", 
            "http://geoforst.com:8082/geoserver/geoforst/wms",
            {
                LAYERS: 'geoforst_base_layers',
                STYLES: '',
                format: format,
                transparent: "true",
                projection: new OpenLayers.Projection('EPSG:3857')
            },
            {
                buffer: 0,
                displayOutsideMaxExtent: "false",
                isBaseLayer: false,
             	  yx : {'EPSG:4326' : false}
            } 
        );


    map.addLayers([bing_road, bing_hybrid, bing_aerial, wms_tiled, fire_management, recreation]);
    map.setCenter(new OpenLayers.LonLat(-9311386, 4091253), 9);
};
