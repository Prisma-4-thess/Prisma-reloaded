
<%@ page import="com.meerkat.Signer_unit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin_panel">
		<g:set var="entityName" value="${message(code: 'signer_unit.label', default: 'Signer_unit')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-signer_unit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/admin_panel')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-signer_unit" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="signer_unit.signer.label" default="Signer" /></th>
					
						<g:sortableColumn property="position" title="${message(code: 'signer_unit.position.label', default: 'Position')}" />
					
						<th><g:message code="signer_unit.unit.label" default="Unit" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${signer_unitInstanceList}" status="i" var="signer_unitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${signer_unitInstance.id}">${fieldValue(bean: signer_unitInstance, field: "signer")}</g:link></td>
					
						<td>${fieldValue(bean: signer_unitInstance, field: "position")}</td>
					
						<td>${fieldValue(bean: signer_unitInstance, field: "unit")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${signer_unitInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
