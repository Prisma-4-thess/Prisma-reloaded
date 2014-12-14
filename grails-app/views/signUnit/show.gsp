
<%@ page import="com.meerkat.SignUnit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin_panel">
		<g:set var="entityName" value="${message(code: 'signUnit.label', default: 'SignUnit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-signUnit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/admin_panel')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-signUnit" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list signUnit">
			
				<g:if test="${signUnitInstance?.positionId}">
				<li class="fieldcontain">
					<span id="positionId-label" class="property-label"><g:message code="signUnit.positionId.label" default="Position Id" /></span>
					
						<span class="property-value" aria-labelledby="positionId-label"><g:link controller="orgPosition" action="show" id="${signUnitInstance?.positionId?.id}">${signUnitInstance?.positionId?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${signUnitInstance?.positionLabel}">
				<li class="fieldcontain">
					<span id="positionLabel-label" class="property-label"><g:message code="signUnit.positionLabel.label" default="Position Label" /></span>
					
						<span class="property-value" aria-labelledby="positionLabel-label"><g:fieldValue bean="${signUnitInstance}" field="positionLabel"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:signUnitInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${signUnitInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
