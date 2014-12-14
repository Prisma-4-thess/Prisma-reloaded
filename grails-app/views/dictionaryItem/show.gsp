
<%@ page import="com.meerkat.DictionaryItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin_panel">
		<g:set var="entityName" value="${message(code: 'dictionaryItem.label', default: 'DictionaryItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dictionaryItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/admin_panel')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dictionaryItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dictionaryItem">
			
				<g:if test="${dictionaryItemInstance?.label}">
				<li class="fieldcontain">
					<span id="label-label" class="property-label"><g:message code="dictionaryItem.label.label" default="Label" /></span>
					
						<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${dictionaryItemInstance}" field="label"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dictionaryItemInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="dictionaryItem.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="dictionaryItem" action="show" id="${dictionaryItemInstance?.parent?.id}">${dictionaryItemInstance?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${dictionaryItemInstance?.dictionary}">
				<li class="fieldcontain">
					<span id="dictionary-label" class="property-label"><g:message code="dictionaryItem.dictionary.label" default="Dictionary" /></span>
					
						<span class="property-value" aria-labelledby="dictionary-label"><g:link controller="dictionary" action="show" id="${dictionaryItemInstance?.dictionary?.id}">${dictionaryItemInstance?.dictionary?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:dictionaryItemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${dictionaryItemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
