
<%@ page import="com.meerkat.Organization" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin_panel">
		<g:set var="entityName" value="${message(code: 'organization.label', default: 'Organization')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-organization" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/admin_panel')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-organization" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="label" title="${message(code: 'organization.label.label', default: 'Label')}" />
					
						<g:sortableColumn property="uid" title="${message(code: 'organization.uid.label', default: 'Uid')}" />
					
						<g:sortableColumn property="odeManagerEmail" title="${message(code: 'organization.odeManagerEmail.label', default: 'Ode Manager Email')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'organization.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="vatNumber" title="${message(code: 'organization.vatNumber.label', default: 'Vat Number')}" />
					
						<g:sortableColumn property="website" title="${message(code: 'organization.website.label', default: 'Website')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${organizationInstanceList}" status="i" var="organizationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${organizationInstance.id}">${fieldValue(bean: organizationInstance, field: "label")}</g:link></td>
					
						<td>${fieldValue(bean: organizationInstance, field: "uid")}</td>
					
						<td>${fieldValue(bean: organizationInstance, field: "odeManagerEmail")}</td>
					
						<td>${fieldValue(bean: organizationInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: organizationInstance, field: "vatNumber")}</td>
					
						<td>${fieldValue(bean: organizationInstance, field: "website")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${organizationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
