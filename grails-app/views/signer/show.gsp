
<%@ page import="com.meerkat.Signer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'signer.label', default: 'Signer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-signer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-signer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list signer">
			
				<g:if test="${signerInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="signer.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${signerInstance?.active}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${signerInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="signer.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${signerInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${signerInstance?.hasOrganizatioSignRights}">
				<li class="fieldcontain">
					<span id="hasOrganizatioSignRights-label" class="property-label"><g:message code="signer.hasOrganizatioSignRights.label" default="Has Organizatio Sign Rights" /></span>
					
						<span class="property-value" aria-labelledby="hasOrganizatioSignRights-label"><g:formatBoolean boolean="${signerInstance?.hasOrganizatioSignRights}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${signerInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="signer.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${signerInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${signerInstance?.org}">
				<li class="fieldcontain">
					<span id="org-label" class="property-label"><g:message code="signer.org.label" default="Org" /></span>
					
						<span class="property-value" aria-labelledby="org-label"><g:link controller="organization" action="show" id="${signerInstance?.org?.id}">${signerInstance?.org?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${signerInstance?.position}">
				<li class="fieldcontain">
					<span id="position-label" class="property-label"><g:message code="signer.position.label" default="Position" /></span>
					
						<span class="property-value" aria-labelledby="position-label"><g:link controller="orgPosition" action="show" id="${signerInstance?.position?.id}">${signerInstance?.position?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:signerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${signerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>