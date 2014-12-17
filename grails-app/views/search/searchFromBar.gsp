<%--
  Created by IntelliJ IDEA.
  User: spiros
  Date: 12/17/14
  Time: 11:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<g:render template="search_bar" model="['searchBarQuery':searchBarQuery]"/>

<g:render template="search_results" model="['decisionList': decisionList, 'signerList': signerList, 'typeList': typeList, 'geoList': geoList]"/>

</body>
</html>