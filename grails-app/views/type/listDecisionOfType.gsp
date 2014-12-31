<%--
  Created by IntelliJ IDEA.
  User: meerkat
  Date: 12/30/14
  Time: 4:27 PM
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
        <div class="panel-heading">${typeInstance.label}</div>

        <div class="row"><div class="col-md-12"><p></p></div></div>
        <g:render template="/decision/list" model="['decisionList': decisionList, 'numOfResults': numOfResults, 'offset': offset]"/>
    </div>
</div>
</body>
</html>