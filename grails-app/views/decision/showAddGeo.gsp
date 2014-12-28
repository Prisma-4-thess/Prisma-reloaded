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
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script>
        function initialize() {
            var mapCanvas = document.getElementById('map-canvas');
            var mapOptions = {
                center: new google.maps.LatLng(44.5403, -78.5463),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            var map = new google.maps.Map(mapCanvas, mapOptions);
        }
        google.maps.event.addDomListener(window, 'load', initialize);

    </script>

</head>

<body>
%{--Todo: Load Map--}%
<div class="container-fluid">
<div class="row">
    <div class="col-md-8 ">
        <g:render template="/geo/map_to_add_geo"/>
    </div>

    <div id="nearbyGeos">
        skataki
    </div>
</div>

<div class="row">

    <div class="col-md-12" style="border: solid">

        <g:formRemote url="[controller: 'decision', action: 'addGeo']" name="add_geo_info" update="response">

            <g:textField name="latitude" placeholder="latitude"/>
            <g:textField name="longitude" placeholder="longitude"/>
            <g:textField name="address" placeholder="Address"/>
            <g:textField name="namegrk" placeholder="Name"/>
            <g:actionSubmitImage value="addGeo" action="addGeo" src="${resource(dir: 'images', file: 'icons/png/Toilet-Paper.png')}"/>
            <span id="response">yolo</span>
        %{--<g:submitButton name=" "/>--}%
        </g:formRemote>
    </div>
</div>
</div>
<script>
    ${remoteFunction( controller: 'geo',
                    action: 'showNearbyGeo',
                    update: [success: 'nearbyGeos', failure: 'nearbyGeos'],
                    params: '\'lat=\' + 40.599+ \'&lon=\' + 22.968')}

</script>

</body>
</html>