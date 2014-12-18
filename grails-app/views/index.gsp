<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Prisma</title>
    <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

    <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

    <!-- Loading Bootstrap -->
    <link href="css/vendor/bootstrap.min.css" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="css/flat-ui.css" rel="stylesheet">
    <link href="css/demo.css" rel="stylesheet">

    <link rel="shortcut icon" href="img/favicon.ico">

    <script src="js/vendor/jquery.min.js"></script>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="js/vendor/html5shiv.js"></script>
      <script src="js/vendor/respond.min.js"></script>
    <![endif]-->
    <style>
    #map-canvas {
        width: 100%;
        height: 400px;
    }

    #mainContent {
        background-color: #1abc9c;
        opacity: 0.4;
        filter: Alpha(opacity=40);
        transition: opacity 1s linear;
    }

</style>
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

<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0%;">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Prisma</a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Default</a></li>
                <li><a href="#">Static top</a></li>
                <li><a href="#">Fixed top</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-xs-offset-6">
            <button type="button" class="btn btn-default arrow-down" id="fadeIn">display map</button>
            <button type="button" class="btn btn-default" id="fadeOut" style="display: none;">hide map</button>
        </div>
    </div>
</div>

<div id="mainContent" class="jumbotron" style="padding-top: 2%;">
    <div id="map-canvas"></div>
</div>

<footer style="background-color: #003333;">
    <div class="container">
        <div class="row">
            <div class="col-xs-12" align="center">
                <g:set var="currentYear" value="${new Date()[Calendar.YEAR]}"/>
                <h6 class="footer-title"><g:link base="http://www.meerkat.gr" target="_blank">Meerkat</g:link> &copy  All Rights Reserved ${currentYear} <br/>
                    <g:link base="https://www.facebook.com/meerkat.gr?ref=ts&fref=ts" target="_blank"><span class="fui-facebook"></span></g:link>
                    <g:link base="https://twitter.com/meerkat_team "><span class="fui-twitter"></span></g:link>
                    <span class="fui-linkedin"></span>
                </h6>
            </div>
        </div>
    </div>
</footer>

<script>
    document.getElementById('map-canvas').style.pointerEvents = 'none';
    $('#fadeIn').click(function () {
        document.getElementById('map-canvas').style.pointerEvents = 'auto';
        $('#mainContent').css({
            'background-color': '#1abc9c',
            'opacity': '1'
        });
        $('#fadeIn').css({
            'display': 'none'
        });
        $('#fadeOut').css({
            'display': 'inline'
        });
    });
    $('#fadeOut').click(function () {
        document.getElementById('map-canvas').style.pointerEvents = 'none';
        $('#mainContent').css({
            'background-color': '#1abc9c',
            'opacity': '0.4',
            'filter': 'Alpha(opacity=40)'
        });
        $('#fadeIn').css({
            'display': 'inline'
        });
        $('#fadeOut').css({
            'display': 'none'
        });
    });
</script>
<script src="js/flat-ui.min.js"></script>
<script src="js/application.js"></script>

</body>
</html>