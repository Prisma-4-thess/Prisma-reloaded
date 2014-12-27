
<%@ page import="com.meerkat.Organization" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organization.label', default: 'Organization')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-organization" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-organization" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list organization">
			
				<g:if test="${organizationInstance?.label}">
				<li class="fieldcontain">
					<span id="label-label" class="property-label"><g:message code="organization.label.label" default="Label" /></span>
					
						<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${organizationInstance}" field="label"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizationInstance?.uid}">
				<li class="fieldcontain">
					<span id="uid-label" class="property-label"><g:message code="organization.uid.label" default="Uid" /></span>
					
						<span class="property-value" aria-labelledby="uid-label"><g:fieldValue bean="${organizationInstance}" field="uid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizationInstance?.odeManagerEmail}">
				<li class="fieldcontain">
					<span id="odeManagerEmail-label" class="property-label"><g:message code="organization.odeManagerEmail.label" default="Ode Manager Email" /></span>
					
						<span class="property-value" aria-labelledby="odeManagerEmail-label"><g:fieldValue bean="${organizationInstance}" field="odeManagerEmail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizationInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="organization.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${organizationInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizationInstance?.vatNumber}">
				<li class="fieldcontain">
					<span id="vatNumber-label" class="property-label"><g:message code="organization.vatNumber.label" default="Vat Number" /></span>
					
						<span class="property-value" aria-labelledby="vatNumber-label"><g:fieldValue bean="${organizationInstance}" field="vatNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organizationInstance?.website}">
				<li class="fieldcontain">
					<span id="website-label" class="property-label"><g:message code="organization.website.label" default="Website" /></span>
					
						<span class="property-value" aria-labelledby="website-label"><g:fieldValue bean="${organizationInstance}" field="website"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:organizationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${organizationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
