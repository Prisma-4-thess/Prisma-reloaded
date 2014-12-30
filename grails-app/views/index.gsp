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

<div>
    <button type="button" class="btn  customFadeInBtn" id="fadeIn">
        <g:img dir="images" file="icons/png/up-icon.png"/>
    </button>

    <button type="button" class="btn  customFadeOutBtn" id="fadeOut">
        <g:img dir="images" file="icons/png/down-icon.png"/>
    </button>
</div>

<div id="mainContent" class="container-fluid">

    <div  id="map-canvas" class="col-md-12 mapWithDec"></div>


    <div class="tooltip-actions" data-trigger="hover" data-placement="left" data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">
        <g:img dir="images" file="icons/png/information-icon.png"/>
    </div>

    <div class="row homepageSearchBar">
        <div class="col-md-3"></div>

        <div id="overMap" class="col-md-6">
            <h2 id="welcomeTag" class="text-center">Welcome to Prisma</h2>
            <g:render template="/search/search_bar"/>

        </div>

        <div class="col-md-3"></div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('.mapWithDec').css({'pointer-events':'none'});
        $('.tooltip-actions').hide().delay(300).fadeIn('slow');
        $('#welcomeTag').hide().delay(500).fadeIn('slow');
        $('#mainSearch').hide().delay(700).fadeIn('slow');
    });
</script>
</body>
</html>