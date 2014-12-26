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
    <button type="button" class="btn  customFadeInBtn" id="fadeIn"><g:img dir="images" file="icons/png/up-icon.png"/></button>
    <button type="button" class="btn  customFadeOutBtn" id="fadeOut"><g:img dir="images" file="icons/png/down-icon.png"/></button>
</div>


<div id="mainContent" class="jumbotron customJumbotron">
    <div id="map-canvas"></div>
    <div class="tooltip-actions" data-trigger="hover" data-placement="left" data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">
        <g:img dir="images" file="icons/png/information-icon.png"/>
    </div>

    <div class="container">
        <div class="row row-centered">
            <div class="col-xs-6 col-centered col-fixed">
                <div class="item">
                    <div class="content">
                        <div id="overMap">
                            <h2 id="welcomeTag">Welcome to Prisma</h2>
                            <g:render template="/search/search_bar"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>