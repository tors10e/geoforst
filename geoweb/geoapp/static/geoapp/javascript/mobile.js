// initialize map when page ready
var map;

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
            new OpenLayers.Control.Zoom()
        ],
        layers: [
            new OpenLayers.Layer.OSM("OpenStreetMap", null, {
                transitionEffect: 'resize'
            })
            //,
//            new OpenLayers.Layer.Google(
//            	    "Google Physical",
//            	    {type: google.maps.MapTypeId.TERRAIN}
//            )
        ],
        center: new OpenLayers.LonLat(-9311386, 4091253),
        zoom: 9
    });
    var gphy = new OpenLayers.Layer.Google(
    	    "Google Physical",
    	    {type: google.maps.MapTypeId.TERRAIN}
    );
    map.addLayers([gphy]);
};
