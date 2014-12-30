<%--
  Created by IntelliJ IDEA.
  User: spirosbond
  Date: 12/30/14
  Time: 3:30 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main_layout"/>
    <title></title>
</head>

<body>
<div class="container-fluid">

    <div class="row"><div class="col-md-12"><p></p></div></div>

    <div class="panel panel-info">
        <div class="panel-heading">Locations</div>

        <div class="row"><div class="col-md-12"><p></p></div></div>

        <g:render template="list" model="['geoList': geoList, 'numOfResults': geoList.size(), 'offset': geoOffset]"/>
    </div>
</div>
</body>
</html>