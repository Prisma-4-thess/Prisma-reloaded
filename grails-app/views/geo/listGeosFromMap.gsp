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
<g:render template="list" model="['geoList': geoList, 'numOfResults': geoList.size(), 'offset':geoOffset]"/>

</body>
</html>