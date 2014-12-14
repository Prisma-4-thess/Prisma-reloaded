
<%@ page import="com.meerkat.SignUnit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'signUnit.label', default: 'SignUnit')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-signUnit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-signUnit" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="signUnit.positionId.label" default="Position Id" /></th>
					
						<g:sortableColumn property="positionLabel" title="${message(code: 'signUnit.positionLabel.label', default: 'Position Label')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${signUnitInstanceList}" status="i" var="signUnitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${signUnitInstance.id}">${fieldValue(bean: signUnitInstance, field: "positionId")}</g:link></td>
					
						<td>${fieldValue(bean: signUnitInstance, field: "positionLabel")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${signUnitInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
