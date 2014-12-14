
<%@ page import="com.meerkat.ExtraFieldValue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'extraFieldValue.label', default: 'ExtraFieldValue')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-extraFieldValue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-extraFieldValue" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list extraFieldValue">
			
				<g:if test="${extraFieldValueInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="extraFieldValue.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${extraFieldValueInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldValueInstance?.ownerExtraField}">
				<li class="fieldcontain">
					<span id="ownerExtraField-label" class="property-label"><g:message code="extraFieldValue.ownerExtraField.label" default="Owner Extra Field" /></span>
					
						<span class="property-value" aria-labelledby="ownerExtraField-label"><g:link controller="extraField" action="show" id="${extraFieldValueInstance?.ownerExtraField?.id}">${extraFieldValueInstance?.ownerExtraField?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:extraFieldValueInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${extraFieldValueInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
