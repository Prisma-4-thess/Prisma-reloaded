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
${typeInstance.label}
<g:render template="/decision/list" model="['decisionList': decisionList, 'numOfResults': numOfResults,'offset':offset]"/>
</body>
</html>