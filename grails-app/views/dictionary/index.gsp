
<%@ page import="com.meerkat.Dictionary" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dictionary.label', default: 'Dictionary')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dictionary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dictionary" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="uid" title="${message(code: 'dictionary.uid.label', default: 'Uid')}" />
					
						<g:sortableColumn property="label" title="${message(code: 'dictionary.label.label', default: 'Label')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dictionaryInstanceList}" status="i" var="dictionaryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dictionaryInstance.id}">${fieldValue(bean: dictionaryInstance, field: "uid")}</g:link></td>
					
						<td>${fieldValue(bean: dictionaryInstance, field: "label")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dictionaryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
