<%@ page import="com.meerkat.Geo" %>
<%--
  Created by IntelliJ IDEA.
  User: spirosbond
  Date: 12/23/14
  Time: 6:38 PM

  This page shows a map to insert a geo to a decision
--%>

<html>
<head>
    <meta name="layout" content="main_layout"/>
    <title></title>
    <script src="http://openlayers.org/en/v3.0.0/build/ol.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyAH_oa4EC3VCWeqeMvTFkQC697gcs_ncyk&sensor=false"></script>

</head>

<body>
%{--Todo: Load Map--}%
<div class="container-fluid">
    <div class="row">
        <div class="col-md-8 ">
            <g:render template="/geo/map_to_add_geo"/>
        </div>

        <div id="nearbyGeos">
        </div>
    </div>

<div class="row formToAddGeo">

<div class="col-md-3">

    <g:formRemote url="[controller: 'decision', action: 'addGeo']" onComplete="showResult()" name="add_geo_info"
                  update="response">

        <g:textField class="form-control" name="latitude" placeholder="latitude"/>
        </div>
        <div class="col-md-3">
            <g:textField name="longitude" class="form-control" placeholder="longitude"/>
        </div>

        <div class="col-md-3">
            <g:textField name="address" class="form-control" placeholder="Address"/>
        </div>

        <div class="col-md-3">
            <g:textField name="namegrk" class="form-control" placeholder="Name"/>
        </div>
        </div>
        <div class="row">
            <div class="col-md-12"><p></p></div>
        </div>
        <div class="row fixedRow">
        <div class="col-md-5"></div>
        <div class="col-md-2 text-center">

        <g:submitButton id="submit-button" name="submitBtn" class="btn btn-primary submit-btn" value="addGeo"
                        action="addGeo"/>

    </g:formRemote>
</div>
    <div id="response" class="col-md-1 text-center"></div>

    <div class="col-md-4"></div>
</div>
</div>
<script>
    function updateFields(name, lat, lng, addr) {
        document.getElementById('latitude').value = lat;
        document.getElementById('longitude').value = lng;
        document.getElementById('address').value = addr;
        document.getElementById('namegrk').value = name;
        updateMarker(lat,lng);
//        marker.setMap(null);
//        placeMarker(new google.maps.LatLng(lat, lng), map);
    }

    function showResult() {
        $('#response-image').css({
            opacity: 0.0,
            visibility: "visible"
        }).animate({opacity: 1}, 'slow').delay(2000).animate({opacity: 0}, 'slow');
    }
    function getNearbyGeoFromController(){
    var paramStr = 'lat='+document.getElementById('latitude').value+'&lon='+document.getElementById('longitude').value;
    console.log(paramStr)
    ${remoteFunction( controller: 'geo',
                    action: 'showNearbyGeo',
                    update: [success: 'nearbyGeos', failure: 'nearbyGeos'],
                    params: 'paramStr')}
    }

</script>

<%--
    Open Layers maps with geocoding from google
    Written by: PuR3v1L
--%>
<script type="text/javascript">
    var geocoder;
    geocoder = new google.maps.Geocoder();
    var map = new ol.Map({
        target: document.getElementById('map-canvas'),
        layers: [
            new ol.layer.Tile({
                source: new ol.source.OSM()
            })
        ],
        view: new ol.View({
            center: ol.proj.transform([22.956065, 40.625129], 'EPSG:4326', 'EPSG:3857'),
            zoom: 12
        })
    });

    var vectorSource = new ol.source.Vector({
        //create empty vector
    });

    map.on('click', function(evt) {
        vectorSource.clear();
        //save position and set map center
        var pos = evt.coordinate;
        console.log(pos[0],pos[1]);
        var newPoint = ol.proj.transform([pos[0], pos[1]], 'EPSG:3857', 'EPSG:4326')
        console.log(newPoint);
        var latlng = new google.maps.LatLng(newPoint[1], newPoint[0]);
        geocoder.geocode({'latLng': latlng}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[1]) {
                    console.log(results[0].formatted_address);
                    document.getElementById('latitude').value = newPoint[1];
                    document.getElementById('longitude').value = newPoint[0];
                    document.getElementById('address').value = results[0].formatted_address;
                    getNearbyGeoFromController();
                } else {
                    alert('No results found');
                }
            } else {
                alert('Geocoder failed due to: ' + status);
            }
        });
        //create icon at new map center
        var iconFeature = new ol.Feature({
            geometry: new ol.geom.Point(pos)
        });

        //add icon to vector source
        vectorSource.addFeature(iconFeature);
    });

    var vectorLayer = new ol.layer.Vector({
        source: vectorSource,
        style:new ol.style.Style({
            image: new ol.style.Icon(({
                anchor: [16, 32],
                anchorXUnits: 'pixels',
                anchorYUnits: 'pixels',
                opacity: 1,
                src: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAADaklEQVRYhb1XW2sTQRQ+Dy1eHiyiRUTBPlRN0hgb12R3ZlZom5hmZhTRB/0DBRFBFJGi9KF/QBAUxAcVRLw9CFYRqSbpBdqXFi+VVk0vpNndgmi9PCiU1vGhbrrZNE02ST1wXnbPOd+338ycMwvgwGbD4RqN4lM6JV0GxdMaJ3MaJ3MGxdM6J080hk4m5foNTmoWZUKSqg1KLumc/Jg5pIqVXOP4u05xuwCoqgh48oC/VqdkoBCw3Q1O+sZCrk1lgae4ulGn5L1TcNN1it7OhsM1JRPQOH6WIzHDYqRFEoOqT/TgBtGLvGJQ9YmR0H6hMbKcEo9LA2fKcXux8Ygi+olX9KCGZb0fe8VEq5yrBMNHSvn6d9Yik1FF9KIl8ITi+RJTXF2JoOtpXPF8NZ/3Iq+YiiKbCuqQI/Cpg4HGrAKHVDGg+jLgccVz+XYdrDXjH23fvi4mu6+Y7wdVn5jh2SqkqOwp/usZOWdNTkZkK/jdfHkJ2X3fjBu3LYXO0OmiCRgc3bAmv23elyHwUnLtyZfXHdjZaMa9a5GyCXBy1YkCD63Jw02NGQKdKzSYToAqM264yW8/DXmVy1WAoTvW5NfN/gyBF9KOrfnynu7dtc2Me9PstymAbxZNQGe405o8Fg4u7YGg+0K+vLjsumjGfTgYsPePjqIJTFM5Yls/0Ye9/zah+9creXezPac7sCuUkD2/e1CD6MNeofHspqRR3FI0ASFJ1QbHn60FRsOBjAoxxbMQD7rvxYLutljQ3RZX3A9iimfBfD8WDtjkRzOOh5PGcIe9o1lPQz637/7FmYDbHYEDAAxJ0nqDkZS9WDIiL84BG/Cg6hPJyHJtGE0m6urWFkZcxnSqnMg36VIUiWREFslWWaQozjsR01HlWEngphmU9Jc6jjVOEmWBAwAYXJV0Tv44vgswsqC1BveWTQAAQKf4llMCBkc3KgIOADAZ8m7RGflZvPT4e/KAv7ZiBAAAdIrbiyZA8fmKggMAPK+vX6NxPFFw7Tn6JCSpuuIEAADSUXS0IAGqHF4VcNM0hmMr7PzuVQUHAEiH0R6d4flccDyfag00rDoBAACDkus5HY+Ra/8FHADgY5O02WD429KZx7Nl/wU5NY2isxkCDJ/5r+AA/+4MjHwwOB6t2I+oU0tHZZamCi2nxl90hdeFBd7ucgAAAABJRU5ErkJggg=='
            }))
        })
    });
    map.addLayer(vectorLayer);

    function updateMarker(lat,lng){
        vectorSource.clear();
        var iconFeature = new ol.Feature({
            geometry: new ol.geom.Point(ol.proj.transform([lng, lat], 'EPSG:4326', 'EPSG:3857'))
        });
        vectorSource.addFeature(iconFeature);
    }

</script>

</body>
</html>