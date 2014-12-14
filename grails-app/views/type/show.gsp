
<%@ page import="com.meerkat.Type" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin_panel">
		<g:set var="entityName" value="${message(code: 'type.label', default: 'Type')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-type" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/admin_panel')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-type" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list type">
			
				<g:if test="${typeInstance?.allowedInDecision}">
				<li class="fieldcontain">
					<span id="allowedInDecision-label" class="property-label"><g:message code="type.allowedInDecision.label" default="Allowed In Decision" /></span>
					
						<span class="property-value" aria-labelledby="allowedInDecision-label"><g:formatBoolean boolean="${typeInstance?.allowedInDecision}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${typeInstance?.extraFields}">
				<li class="fieldcontain">
					<span id="extraFields-label" class="property-label"><g:message code="type.extraFields.label" default="Extra Fields" /></span>
					
						<g:each in="${typeInstance.extraFields}" var="e">
						<span class="property-value" aria-labelledby="extraFields-label"><g:link controller="extraField" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${typeInstance?.label}">
				<li class="fieldcontain">
					<span id="label-label" class="property-label"><g:message code="type.label.label" default="Label" /></span>
					
						<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${typeInstance}" field="label"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${typeInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="type.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="type" action="show" id="${typeInstance?.parent?.id}">${typeInstance?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:typeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${typeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
