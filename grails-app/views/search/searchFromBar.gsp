<%--
  Created by IntelliJ IDEA.
  User: spiros
  Date: 12/17/14
  Time: 11:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main_layout"/>
    <title>Search Results</title>
</head>

<body>
<div class="row emptyRow">
    <div class="container"></div>
</div>

<div class="row searchRow">
    <div class="container">
        <div class="searchBarDefaultSize">
            <g:render template="search_bar" model="['searchBarQuery': searchBarQuery]"/>
        </div>

        <g:render template="search_results" model="['decisionList': decisionList, 'signerList': signerList, 'typeList': typeList, 'geoList': geoList]"/>
    </div>
</div>
</body>
</html>