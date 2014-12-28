%{--This template shows a map with a specified center and all given decisions as markers--}%
%{--parameters: mapCenter, decisionList--}%

<%@ page import="com.meerkat.Geo" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main_layout"/>
    <title>OpenLayers 3 Example</title>
    <link rel="stylesheet" href="http://openlayers.org/en/v3.0.0/css/ol.css" type="text/css">
    <style type="text/css">
    .ol-popup {
        display: none;
        position: absolute;
        background-color: rgba(255,255,255,0.7);
        -moz-box-shadow: 0 1px 4px rgba(0,0,0,0.2);
        padding: 15px;
        border-radius: 10px;
        border: 1px solid #cccccc;
        bottom: 12px;
        left: -50px;
    }
    .ol-popup:after, .ol-popup:before {
        top: 100%;
        border: solid transparent;
        content: " ";
        height: 0;
        width: 0;
        position: absolute;
        pointer-events: none;
    }
    .ol-popup:after {
        border-top-color: white;
        border-width: 10px;
        left: 48px;
        margin-left: -10px;
    }
    .ol-popup:before {
        border-top-color: #cccccc;
        border-width: 11px;
        left: 48px;
        margin-left: -11px;
    }
    .ol-popup-closer {
        text-decoration: none;
        position: absolute;
        top: 2px;
        right: 8px;
    }
    .ol-popup-closer:after {
        content: "✖";
    }
    .map {
        height: 100%;
        width: 100%;
    }
    </style>
    <script src="http://openlayers.org/en/v3.0.0/build/ol.js" type="text/javascript"></script>
</head>

<body>
<h2>My Map</h2>
<div id="map" class="map">
    <div id="popup" class="ol-popup">
        <div id="popup-content"></div>
    </div>
</div>
<script type="text/javascript">
    var container = document.getElementById('popup');
    var content = document.getElementById('popup-content');
    var map = new ol.Map({
        target: document.getElementById('map'),
        layers: [
            new ol.layer.Tile({
                source: new ol.source.OSM()
            })
        ],
        view: new ol.View({
            center: ol.proj.transform([22.956065,40.625129], 'EPSG:4326', 'EPSG:3857'),
            zoom: 12
        })
    });

    var overlay = new ol.Overlay({
        element: container
    });

    map.addOverlay(overlay)

    var vectorSource = new ol.source.Vector({
        //create empty vector
    });
    %{--console.log("MPES")--}%
    <g:each in="${com.meerkat.Geo.all}" var="loc">
    var name_gemp = '${loc.namegrk.replace('\n','')}';
    console.log(${loc.latitude});
        var iconFeature = new ol.Feature({
            geometry: new
                    ol.geom.Point(ol.proj.transform([${loc.longitude}, ${loc.latitude}], 'EPSG:4326', 'EPSG:3857')),
            uid: ${loc.id},
            namegrk: name_gemp,
            population: 4000,
            rainfall: 500
        });
    vectorSource.addFeature(iconFeature);
    </g:each>

//    for (var i=0;i<260;i++) {
//        var iconFeature = new ol.Feature({
//            geometry: new
//                    ol.geom.Point(ol.proj.transform([22.960+(Math.random()-0.5)*0.1, 40.626+(Math.random()-0.5)*0.1], 'EPSG:4326', 'EPSG:3857')),
//            uid: i,
//            namegrk: 'testing',
//            population: 4000,
//            rainfall: 500
//        });
//        vectorSource.addFeature(iconFeature);
//    }
    //    //create the style
    //    var iconStyle = new ol.style.Style({
    //        image: new ol.style.Icon(/** @type {olx.style.IconOptions} */ ({
    //            anchor: [16, 32],
    //            anchorXUnits: 'pixels',
    //            anchorYUnits: 'pixels',
    //            opacity: 1,
    //            src: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAADaklEQVRYhb1XW2sTQRQ+Dy1eHiyiRUTBPlRN0hgb12R3ZlZom5hmZhTRB/0DBRFBFJGi9KF/QBAUxAcVRLw9CFYRqSbpBdqXFi+VVk0vpNndgmi9PCiU1vGhbrrZNE02ST1wXnbPOd+338ycMwvgwGbD4RqN4lM6JV0GxdMaJ3MaJ3MGxdM6J080hk4m5foNTmoWZUKSqg1KLumc/Jg5pIqVXOP4u05xuwCoqgh48oC/VqdkoBCw3Q1O+sZCrk1lgae4ulGn5L1TcNN1it7OhsM1JRPQOH6WIzHDYqRFEoOqT/TgBtGLvGJQ9YmR0H6hMbKcEo9LA2fKcXux8Ygi+olX9KCGZb0fe8VEq5yrBMNHSvn6d9Yik1FF9KIl8ITi+RJTXF2JoOtpXPF8NZ/3Iq+YiiKbCuqQI/Cpg4HGrAKHVDGg+jLgccVz+XYdrDXjH23fvi4mu6+Y7wdVn5jh2SqkqOwp/usZOWdNTkZkK/jdfHkJ2X3fjBu3LYXO0OmiCRgc3bAmv23elyHwUnLtyZfXHdjZaMa9a5GyCXBy1YkCD63Jw02NGQKdKzSYToAqM264yW8/DXmVy1WAoTvW5NfN/gyBF9KOrfnynu7dtc2Me9PstymAbxZNQGe405o8Fg4u7YGg+0K+vLjsumjGfTgYsPePjqIJTFM5Yls/0Ye9/zah+9creXezPac7sCuUkD2/e1CD6MNeofHspqRR3FI0ASFJ1QbHn60FRsOBjAoxxbMQD7rvxYLutljQ3RZX3A9iimfBfD8WDtjkRzOOh5PGcIe9o1lPQz637/7FmYDbHYEDAAxJ0nqDkZS9WDIiL84BG/Cg6hPJyHJtGE0m6urWFkZcxnSqnMg36VIUiWREFslWWaQozjsR01HlWEngphmU9Jc6jjVOEmWBAwAYXJV0Tv44vgswsqC1BveWTQAAQKf4llMCBkc3KgIOADAZ8m7RGflZvPT4e/KAv7ZiBAAAdIrbiyZA8fmKggMAPK+vX6NxPFFw7Tn6JCSpuuIEAADSUXS0IAGqHF4VcNM0hmMr7PzuVQUHAEiH0R6d4flccDyfag00rDoBAACDkus5HY+Ra/8FHADgY5O02WD429KZx7Nl/wU5NY2isxkCDJ/5r+AA/+4MjHwwOB6t2I+oU0tHZZamCi2nxl90hdeFBd7ucgAAAABJRU5ErkJggg=='
    //        }))
    //    });
    //
    //    var vectorLayer = new ol.layer.Vector({
    //        source: vectorSource,
    //        style: iconStyle
    //    });

    var clusterSource = new ol.source.Cluster({
        distance: 40,
        source: vectorSource
    });

    var styleCache = {};
    var clusters = new ol.layer.Vector({
        source: clusterSource,
        style: function(feature, resolution) {
            var size = feature.get('features').length;
            var exp_radius = (size > 10) ? 27 : 17+size
            var style = styleCache[size];
            if (size == 1){
                style = [new ol.style.Style({
                    image: new ol.style.Circle({
                        radius: 5,
                        stroke: new ol.style.Stroke({
                            color: [255,255,255,1]
                        }),
                        fill: new ol.style.Fill({
                            color: [255,69,0,1]
                        })
                    })

//                            new ol.style.Icon(/** @type {olx.style.IconOptions} */ ({
//                        anchor: [16, 32],
//                        anchorXUnits: 'pixels',
//                        anchorYUnits: 'pixels',
//                        opacity: 1,
//                        src: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAADaklEQVRYhb1XW2sTQRQ+Dy1eHiyiRUTBPlRN0hgb12R3ZlZom5hmZhTRB/0DBRFBFJGi9KF/QBAUxAcVRLw9CFYRqSbpBdqXFi+VVk0vpNndgmi9PCiU1vGhbrrZNE02ST1wXnbPOd+338ycMwvgwGbD4RqN4lM6JV0GxdMaJ3MaJ3MGxdM6J080hk4m5foNTmoWZUKSqg1KLumc/Jg5pIqVXOP4u05xuwCoqgh48oC/VqdkoBCw3Q1O+sZCrk1lgae4ulGn5L1TcNN1it7OhsM1JRPQOH6WIzHDYqRFEoOqT/TgBtGLvGJQ9YmR0H6hMbKcEo9LA2fKcXux8Ygi+olX9KCGZb0fe8VEq5yrBMNHSvn6d9Yik1FF9KIl8ITi+RJTXF2JoOtpXPF8NZ/3Iq+YiiKbCuqQI/Cpg4HGrAKHVDGg+jLgccVz+XYdrDXjH23fvi4mu6+Y7wdVn5jh2SqkqOwp/usZOWdNTkZkK/jdfHkJ2X3fjBu3LYXO0OmiCRgc3bAmv23elyHwUnLtyZfXHdjZaMa9a5GyCXBy1YkCD63Jw02NGQKdKzSYToAqM264yW8/DXmVy1WAoTvW5NfN/gyBF9KOrfnynu7dtc2Me9PstymAbxZNQGe405o8Fg4u7YGg+0K+vLjsumjGfTgYsPePjqIJTFM5Yls/0Ye9/zah+9creXezPac7sCuUkD2/e1CD6MNeofHspqRR3FI0ASFJ1QbHn60FRsOBjAoxxbMQD7rvxYLutljQ3RZX3A9iimfBfD8WDtjkRzOOh5PGcIe9o1lPQz637/7FmYDbHYEDAAxJ0nqDkZS9WDIiL84BG/Cg6hPJyHJtGE0m6urWFkZcxnSqnMg36VIUiWREFslWWaQozjsR01HlWEngphmU9Jc6jjVOEmWBAwAYXJV0Tv44vgswsqC1BveWTQAAQKf4llMCBkc3KgIOADAZ8m7RGflZvPT4e/KAv7ZiBAAAdIrbiyZA8fmKggMAPK+vX6NxPFFw7Tn6JCSpuuIEAADSUXS0IAGqHF4VcNM0hmMr7PzuVQUHAEiH0R6d4flccDyfag00rDoBAACDkus5HY+Ra/8FHADgY5O02WD429KZx7Nl/wU5NY2isxkCDJ/5r+AA/+4MjHwwOB6t2I+oU0tHZZamCi2nxl90hdeFBd7ucgAAAABJRU5ErkJggg=='
//                    }))
                })];
            }
            else if (!style) {
                style = [new ol.style.Style({
                    image: new ol.style.Circle({
                        radius: exp_radius,
                        stroke: new ol.style.Stroke({
                            color: [0,0,0,0.7]
                        }),
                        fill: new ol.style.Fill({
                            color: [133,255,133,0.4]
                        })
                    }),
                    text: new ol.style.Text({
                        text: size.toString(),
                        fill: new ol.style.Fill({
                            color: '#111'
                        })
                    })
                })];
                styleCache[size] = style;
            }
            return style;
        }
    });

    //    map.addLayer(vectorLayer)
    map.on('pointermove', function(evt) {
        var feature = map.forEachFeatureAtPixel(evt.pixel,
                function(feature, layer) {
                    var index;
                    if (feature.p.features.length >1) return null;
                    for (index=0;index < feature.p.features.length;++index) {
                        overlay.setPosition(feature.p.features[index].p.geometry.j);
                        content.innerHTML = feature.p.features[index].p.namegrk;
                        container.style.display = 'block';
                    }
                    return feature;
                });
        if (feature==null){
            container.style.display = 'none';
            map.getTarget().style.cursor = '';
        }else{
            map.getTarget().style.cursor = 'pointer';
        }
    });

    map.on('click', function(evt) {
        var feature = map.forEachFeatureAtPixel(evt.pixel,
                function(feature, layer) {
                    var index;
                    if (feature.p.features.length >1) return null;
                    for (index=0;index < feature.p.features.length;++index) {
                        console.log(feature.p.features[index].p.uid + ' clicked!');
                    }
                    return feature;
                });
    });

    map.addLayer(clusters)
</script>
</body>