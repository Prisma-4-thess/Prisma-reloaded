
<%@ page import="com.meerkat.Unit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unit.label', default: 'Unit')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-unit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-unit" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="unit.parent.label" default="Parent" /></th>
					
						<g:sortableColumn property="abbreviation" title="${message(code: 'unit.abbreviation.label', default: 'Abbreviation')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'unit.active.label', default: 'Active')}" />
					
						<th><g:message code="unit.category.label" default="Category" /></th>
					
						<g:sortableColumn property="label" title="${message(code: 'unit.label.label', default: 'Label')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${unitInstanceList}" status="i" var="unitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${unitInstance.id}">${fieldValue(bean: unitInstance, field: "parent")}</g:link></td>
					
						<td>${fieldValue(bean: unitInstance, field: "abbreviation")}</td>
					
						<td><g:formatBoolean boolean="${unitInstance.active}" /></td>
					
						<td>${fieldValue(bean: unitInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: unitInstance, field: "label")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${unitInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>