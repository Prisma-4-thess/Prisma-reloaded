
<%@ page import="com.meerkat.ExtraFieldValue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin_panel">
		<g:set var="entityName" value="${message(code: 'extraFieldValue.label', default: 'ExtraFieldValue')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-extraFieldValue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/admin_panel')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-extraFieldValue" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="value" title="${message(code: 'extraFieldValue.value.label', default: 'Value')}" />
					
						<th><g:message code="extraFieldValue.ownerExtraField.label" default="Owner Extra Field" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${extraFieldValueInstanceList}" status="i" var="extraFieldValueInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${extraFieldValueInstance.id}">${fieldValue(bean: extraFieldValueInstance, field: "value")}</g:link></td>
					
						<td>${fieldValue(bean: extraFieldValueInstance, field: "ownerExtraField")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${extraFieldValueInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
