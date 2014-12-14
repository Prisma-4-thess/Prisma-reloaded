
<%@ page import="com.meerkat.Signer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin_panel">
		<g:set var="entityName" value="${message(code: 'signer.label', default: 'Signer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-signer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/admin_panel')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-signer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="active" title="${message(code: 'signer.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="activeFrom" title="${message(code: 'signer.activeFrom.label', default: 'Active From')}" />
					
						<g:sortableColumn property="activeUntil" title="${message(code: 'signer.activeUntil.label', default: 'Active Until')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'signer.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="hasOrganizationSignRights" title="${message(code: 'signer.hasOrganizationSignRights.label', default: 'Has Organization Sign Rights')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'signer.lastName.label', default: 'Last Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${signerInstanceList}" status="i" var="signerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${signerInstance.id}">${fieldValue(bean: signerInstance, field: "active")}</g:link></td>
					
						<td>${fieldValue(bean: signerInstance, field: "activeFrom")}</td>
					
						<td>${fieldValue(bean: signerInstance, field: "activeUntil")}</td>
					
						<td>${fieldValue(bean: signerInstance, field: "firstName")}</td>
					
						<td><g:formatBoolean boolean="${signerInstance.hasOrganizationSignRights}" /></td>
					
						<td>${fieldValue(bean: signerInstance, field: "lastName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${signerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
