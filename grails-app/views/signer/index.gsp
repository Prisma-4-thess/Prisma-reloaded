
<%@ page import="com.meerkat.Signer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'signer.label', default: 'Signer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-signer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
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
					
						<g:sortableColumn property="uid" title="${message(code: 'signer.uid.label', default: 'Uid')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'signer.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'signer.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="hasOrganizatioSignRights" title="${message(code: 'signer.hasOrganizatioSignRights.label', default: 'Has Organizatio Sign Rights')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'signer.lastName.label', default: 'Last Name')}" />
					
						<th><g:message code="signer.org.label" default="Org" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${signerInstanceList}" status="i" var="signerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${signerInstance.id}">${fieldValue(bean: signerInstance, field: "uid")}</g:link></td>
					
						<td><g:formatBoolean boolean="${signerInstance.active}" /></td>
					
						<td>${fieldValue(bean: signerInstance, field: "firstName")}</td>
					
						<td><g:formatBoolean boolean="${signerInstance.hasOrganizatioSignRights}" /></td>
					
						<td>${fieldValue(bean: signerInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: signerInstance, field: "org")}</td>
					
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
