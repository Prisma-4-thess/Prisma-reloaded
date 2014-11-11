
<%@ page import="com.meerkat.ExtraField" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'extraField.label', default: 'ExtraField')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-extraField" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-extraField" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="type" title="${message(code: 'extraField.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="validation" title="${message(code: 'extraField.validation.label', default: 'Validation')}" />
					
						<g:sortableColumn property="dictionary" title="${message(code: 'extraField.dictionary.label', default: 'Dictionary')}" />
					
						<g:sortableColumn property="relAdaConstrainedInOrganization" title="${message(code: 'extraField.relAdaConstrainedInOrganization.label', default: 'Rel Ada Constrained In Organization')}" />
					
						<g:sortableColumn property="help" title="${message(code: 'extraField.help.label', default: 'Help')}" />
					
						<g:sortableColumn property="label" title="${message(code: 'extraField.label.label', default: 'Label')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${extraFieldInstanceList}" status="i" var="extraFieldInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${extraFieldInstance.id}">${fieldValue(bean: extraFieldInstance, field: "type")}</g:link></td>
					
						<td>${fieldValue(bean: extraFieldInstance, field: "validation")}</td>
					
						<td>${fieldValue(bean: extraFieldInstance, field: "dictionary")}</td>
					
						<td><g:formatBoolean boolean="${extraFieldInstance.relAdaConstrainedInOrganization}" /></td>
					
						<td>${fieldValue(bean: extraFieldInstance, field: "help")}</td>
					
						<td>${fieldValue(bean: extraFieldInstance, field: "label")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${extraFieldInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
