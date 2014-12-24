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
</head>

<body>
%{--Todo: Load Map--}%
<div id="nearbyGeos">
    skataki
</div>

<script>
    ${remoteFunction( controller: 'geo',
                    action: 'showNearbyGeos',
                    update: [success: 'nearbyGeos', failure: 'nearbyGeos'],
                    params: '\'lat=\' + 40.636 + \'&lon=\' + 22.938')}

</script>

<g:formRemote url="[controller: 'decision', action: 'addGeo']" name="add_geo_info" update="response">

    <g:textField name="latitude" placeholder="latitude"/>
    <g:textField name="longitude" placeholder="longitude"/>
    <g:textField name="address" placeholder="Address"/>
    <g:textField name="namegrk" placeholder="Name"/>
    <g:actionSubmitImage value="addGeo" action="addGeo" src="${resource(dir: 'images', file: 'icons/png/Toilet-Paper.png')}" />
    <span id="response">yolo</span>
    %{--<g:submitButton name=" "/>--}%
</g:formRemote>

</body>
</html>