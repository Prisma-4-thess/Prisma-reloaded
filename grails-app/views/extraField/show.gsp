
<%@ page import="com.meerkat.ExtraField" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'extraField.label', default: 'ExtraField')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-extraField" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-extraField" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list extraField">
			
				<g:if test="${extraFieldInstance?.extra_field_name}">
				<li class="fieldcontain">
					<span id="extra_field_name-label" class="property-label"><g:message code="extraField.extra_field_name.label" default="Extrafieldname" /></span>
					
						<span class="property-value" aria-labelledby="extra_field_name-label"><g:fieldValue bean="${extraFieldInstance}" field="extra_field_name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.extra_field_value}">
				<li class="fieldcontain">
					<span id="extra_field_value-label" class="property-label"><g:message code="extraField.extra_field_value.label" default="Extrafieldvalue" /></span>
					
						<span class="property-value" aria-labelledby="extra_field_value-label"><g:fieldValue bean="${extraFieldInstance}" field="extra_field_value"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.decision}">
				<li class="fieldcontain">
					<span id="decision-label" class="property-label"><g:message code="extraField.decision.label" default="Decision" /></span>
					
						<span class="property-value" aria-labelledby="decision-label"><g:link controller="decision" action="show" id="${extraFieldInstance?.decision?.id}">${extraFieldInstance?.decision?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:extraFieldInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${extraFieldInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
