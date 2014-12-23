<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main_layout"/>
    <title>Prisma | Meerkat</title>
    <meta name="description" content=""/>


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

        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        $(function () {
            $('[data-toggle="popover"]').popover()
        })
    </script>
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-xs-offset-6">

            <button type="button" class="btn btn-default customFadeInBtn" id="fadeIn"><g:img dir="images" file="icons/png/up-arrow-circle-hi.png" /></button>
            <button type="button" class="btn btn-default customFadeOutBtn" id="fadeOut"><g:img dir="images" file="icons/png/down-arrow-circle-hi.png" /></button>
        </div>
    </div>
</div>

<div id="mainContent" class="jumbotron customJumbotron">
    <div id="map-canvas"></div>
    <span class="tooltip-actions" data-trigger="hover" data-placement="bottom" data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">
        <g:img dir="images" file="icons/png/information-icon.png" />
    </span>
    <div class="row search">
        <div id="overMap">
            <h2 id="welcomeTag">Welcome to Prisma</h2>
            <g:render template="/search/search_bar"/>
        </div>
    </div>
</div>


</body>
</html>