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

    function showResult() {
        $('#response-image').css({
            opacity: 0.0,
            visibility: "visible"
        }).animate({opacity: 1}, 'slow').delay(2000).animate({opacity: 0}, 'slow');
    }

    ${remoteFunction( controller: 'geo',
                    action: 'showNearbyGeo',
                    update: [success: 'nearbyGeos', failure: 'nearbyGeos'],
                    params: '\'lat=\' + 40.599+ \'&lon=\' + 22.968')}

</script>

</body>
</html>