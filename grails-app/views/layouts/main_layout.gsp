<%--
  Created by IntelliJ IDEA.
  User: spiros
  Date: 12/14/14
  Time: 4:50 PM
  This should include all common files needed for the main homepage.
  Stuff like javascript includes, css includes, scroll to top elements etc belong here
--%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Prisma"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

    <!-- Loading Bootstrap -->
    %{--<link href="/css/vendor/bootstrap.min.css" rel="stylesheet">--}%
    <asset:stylesheet src="vendor/bootstrap.min.css"/>

    <!-- Loading Flat UI -->
    <asset:stylesheet src="flat-ui.css"/>
    <asset:stylesheet src="demo.css"/>
    <asset:stylesheet src="flat-ui.css"/>
    <asset:stylesheet src="custom.css"/>
    %{--<link href="/grails-app/assets/stylesheets/demo.css" rel="stylesheet">--}%
    %{--<link href="/grails-app/assets/stylesheets/custom.css" rel="stylesheet">--}%
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}">

    <asset:javascript src="vendor/jquery.min.js"/>
    %{--<script src="/js/vendor/jquery.min.js"></script>--}%
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
    <asset:javascript src="vendor/html5shiv.js"/>
    <asset:javascript src="vendor/respond.min.js"/>
     <!-- <script src="/js/vendor/html5shiv.js"></script>
      <script src="/js/vendor/respond.min.js"></script>-->
    <![endif]-->


    <g:layoutHead/>
</head>

<body>

<g:render template="/uiElements/navbar"/>

<g:layoutBody/>

<g:render template="/uiElements/footer"/>


<asset:javascript src="customJs.js"/>
<asset:javascript src="bootstrap.min.js"/>
<asset:javascript src="flat-ui.min.js"/>
<asset:javascript src="application.js"/>
%{--<script src="/grails-app/assets/javascripts/customJs.js"></script>
<script src="/grails-app/assets/javascripts/bootstrap.min.js"></script>
<script src="/grails-app/assets/javascripts/flat-ui.min.js"></script>
<script src="/grails-app/assets/javascripts/application.js"></script>--}%

</body>
</html>