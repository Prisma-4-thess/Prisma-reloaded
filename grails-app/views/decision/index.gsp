
<%@ page import="com.meerkat.Decision" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin_panel">
		<g:set var="entityName" value="${message(code: 'decision.label', default: 'Decision')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-decision" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/admin_panel')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-decision" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="ada" title="${message(code: 'decision.ada.label', default: 'Ada')}" />
					
						<th><g:message code="decision.correctedDecision.label" default="Corrected Decision" /></th>
					
						<th><g:message code="decision.geo.label" default="Geo" /></th>
					
						<g:sortableColumn property="issueDate" title="${message(code: 'decision.issueDate.label', default: 'Issue Date')}" />
					
						<th><g:message code="decision.organization.label" default="Organization" /></th>
					
						<g:sortableColumn property="privateData" title="${message(code: 'decision.privateData.label', default: 'Private Data')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${decisionInstanceList}" status="i" var="decisionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${decisionInstance.id}">${fieldValue(bean: decisionInstance, field: "ada")}</g:link></td>
					
						<td>${fieldValue(bean: decisionInstance, field: "correctedDecision")}</td>
					
						<td>${fieldValue(bean: decisionInstance, field: "geo")}</td>
					
						<td>${fieldValue(bean: decisionInstance, field: "issueDate")}</td>
					
						<td>${fieldValue(bean: decisionInstance, field: "organization")}</td>
					
						<td><g:formatBoolean boolean="${decisionInstance.privateData}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${decisionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
