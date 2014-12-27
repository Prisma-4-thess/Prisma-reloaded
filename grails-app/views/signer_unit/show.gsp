
<%@ page import="com.meerkat.Signer_unit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin_panel">
		<g:set var="entityName" value="${message(code: 'signer_unit.label', default: 'Signer_unit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-signer_unit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/admin_panel')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-signer_unit" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list signer_unit">
			
				<g:if test="${signer_unitInstance?.signer}">
				<li class="fieldcontain">
					<span id="signer-label" class="property-label"><g:message code="signer_unit.signer.label" default="Signer" /></span>
					
						<span class="property-value" aria-labelledby="signer-label"><g:link controller="signer" action="show" id="${signer_unitInstance?.signer?.id}">${signer_unitInstance?.signer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${signer_unitInstance?.position}">
				<li class="fieldcontain">
					<span id="position-label" class="property-label"><g:message code="signer_unit.position.label" default="Position" /></span>
					
						<span class="property-value" aria-labelledby="position-label"><g:fieldValue bean="${signer_unitInstance}" field="position"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${signer_unitInstance?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="signer_unit.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:link controller="unit" action="show" id="${signer_unitInstance?.unit?.id}">${signer_unitInstance?.unit?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
		</div>
	</body>
</html>
