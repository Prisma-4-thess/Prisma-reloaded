<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Prisma | Meerkat</title>
    <meta name="description" content=""/>

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
        opacity: 0.3;
        filter: alpha(opacity=30);
        transition: all .5s ease-out 0.1s;
    }

    #mainContent {
        background: rgba(26, 188, 156, 0.3);
        transition: all .5s ease-out 0.1s;
    }

    #overMap {
        position: absolute;
        margin-top: -25%;
        margin-left: 43%;
    }

    .search {
        margin-left: -11%;
    }

    .form-actions {
        margin: 0;
        background-color: transparent;
        text-align: center;
    }

    .tooltip-actions {
        position: absolute;
        margin-top: -31%;
        margin-left: 94%;
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

        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        $(function () {
            $('[data-toggle="popover"]').popover()
        })
    </script>
</head>

<body>

<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0%;">
    <div class="container">
        <div class="navbar-header">
            <g:link base="/Prisma"><img src="img/site-logo.png"/></g:link>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Default</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact us</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-xs-offset-6">
            <button type="button" class="btn btn-default" id="fadeIn" style="padding:2px 4px;"><img src="img/icons/png/up-arrow-circle-hi.png"/></button>
            <button type="button" class="btn btn-default" id="fadeOut" style="display: none; padding:2px 4px;"><img src="img/icons/png/down-arrow-circle-hi.png"/></button>
        </div>
    </div>
</div>

<div id="mainContent" class="jumbotron" style="padding-top: 2%;">
    <div id="map-canvas"></div>
    <span class="tooltip-actions" data-trigger="hover" data-placement="bottom" data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">
        <img src="img/icons/png/information-icon.png"/>
    </span>

    <div class="row search">
        <div id="overMap">
            <h2 id="welcomeTag">Welcome to Prisma</h2>

            <form role="form">
                <div class="form-group" id="mainSearch">
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Search decisions, signatories, locations, etc...">
                </div>

                <div class="form-actions" id="submitBtn">
                    <button type="submit" class="btn btn-default" style="background: #1BBC9B; padding: 10px 35px;">Search</button>
                </div>
            </form>
        </div>
    </div>
</div>



<footer style="background-color: #003333;">
    <div class="container">
        <div class="row">
            <div class="col-xs-12" align="center">
                <g:set var="currentYear" value="${new Date()[Calendar.YEAR]}"/>
                <h6 class="footer-title"><g:link base="http://www.meerkat.gr" target="_blank">Meerkat</g:link> &copy  All Rights Reserved ${currentYear} <br/>
                    <g:link base="https://www.facebook.com/meerkat.gr?ref=ts&fref=ts" target="_blank"><span class="fui-facebook"></span></g:link>
                    <g:link base="https://twitter.com/meerkat_team "><span class="fui-twitter"></span></g:link>
                </h6>
            </div>
        </div>
    </div>
</footer>

<script>
    $(document).ready(function () {
        document.getElementById('map-canvas').style.pointerEvents = 'none';
        $('.tooltip-actions').hide().delay(300).fadeIn('slow');
        $('#welcomeTag').hide().delay(500).fadeIn('slow');
        $('#mainSearch').hide().delay(700).fadeIn('slow');
        $('#submitBtn').hide().delay(900).fadeIn('slow');
    });
    $('#fadeIn').click(function () {
        document.getElementById('map-canvas').style.pointerEvents = 'auto';
        $('#mainContent').css({
            background: 'rgba(26, 188, 156,1)'
        });
        $('#fadeIn').css({
            'display': 'none'
        });
        $('#fadeOut').css({
            'display': 'inline'
        });
        $('#map-canvas').css({
            'opacity': '1',
            'filter': 'alpha(opacity=100)'
        });
        $('#overMap').fadeOut('slow');
        $('.tooltip-actions').fadeOut('slow');
    });
    $('#fadeOut').click(function () {
        document.getElementById('map-canvas').style.pointerEvents = 'none';
        $('#mainContent').css({
            background: 'rgba(26, 188, 156,0.3)'
        });
        $('#fadeIn').css({
            'display': 'inline'
        });
        $('#fadeOut').css({
            'display': 'none'
        });
        $('#map-canvas').css({
            'opacity': '0.3',
            'filter': 'alpha(opacity=30)'
        });
        $('#overMap').fadeIn('slow');
        $('.tooltip-actions').fadeIn('slow');
    });
</script>
<script src="js/bootstrap.min.js"></script>
<script src="js/flat-ui.min.js"></script>
<script src="js/application.js"></script>

</body>
</html>