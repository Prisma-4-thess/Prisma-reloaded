<%--
  Created by IntelliJ IDEA.
  User: spirosbond
  Date: 12/30/14
  Time: 2:45 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main_layout"/>
    <title></title>
</head>

<body>
${geoInstance.namegrk}
<g:render template="/decision/list" model="['decisionList':decisionList,'numOfResults':decisionList.size()]"/>
</body>
</html>