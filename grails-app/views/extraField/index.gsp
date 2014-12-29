
<%@ page import="com.meerkat.ExtraField" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin_panel">
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
					
						<g:sortableColumn property="extra_field_name" title="${message(code: 'extraField.extra_field_name.label', default: 'Extrafieldname')}" />
					
						<g:sortableColumn property="extra_field_value" title="${message(code: 'extraField.extra_field_value.label', default: 'Extrafieldvalue')}" />
					
						<th><g:message code="extraField.decision.label" default="Decision" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${extraFieldInstanceList}" status="i" var="extraFieldInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${extraFieldInstance.id}">${fieldValue(bean: extraFieldInstance, field: "extra_field_name")}</g:link></td>
					
						<td>${fieldValue(bean: extraFieldInstance, field: "extra_field_value")}</td>
					
						<td>${fieldValue(bean: extraFieldInstance, field: "decision")}</td>
					
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
