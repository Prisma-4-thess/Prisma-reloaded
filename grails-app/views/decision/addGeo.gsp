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

<div id="nearbyGeos">
skataki
</div>

<script>
  ${remoteFunction( controller: 'geo',
                    action: 'showNearbyGeos',
                    update: [success: 'nearbyGeos', failure: 'nearbyGeos'],
                    params: '\'lat=\' + 40.636 + \'&lon=\' + 22.938')}

</script>

</body>
</html>