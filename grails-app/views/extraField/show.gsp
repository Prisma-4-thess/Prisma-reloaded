
<%@ page import="com.meerkat.ExtraField" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'extraField.label', default: 'ExtraField')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-extraField" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-extraField" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list extraField">
			
				<g:if test="${extraFieldInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="extraField.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${extraFieldInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.validation}">
				<li class="fieldcontain">
					<span id="validation-label" class="property-label"><g:message code="extraField.validation.label" default="Validation" /></span>
					
						<span class="property-value" aria-labelledby="validation-label"><g:fieldValue bean="${extraFieldInstance}" field="validation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.dictionary}">
				<li class="fieldcontain">
					<span id="dictionary-label" class="property-label"><g:message code="extraField.dictionary.label" default="Dictionary" /></span>
					
						<span class="property-value" aria-labelledby="dictionary-label"><g:fieldValue bean="${extraFieldInstance}" field="dictionary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.fixedValueList}">
				<li class="fieldcontain">
					<span id="fixedValueList-label" class="property-label"><g:message code="extraField.fixedValueList.label" default="Fixed Value List" /></span>
					
						<span class="property-value" aria-labelledby="fixedValueList-label"><g:fieldValue bean="${extraFieldInstance}" field="fixedValueList"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.relAdaDecisionTypes}">
				<li class="fieldcontain">
					<span id="relAdaDecisionTypes-label" class="property-label"><g:message code="extraField.relAdaDecisionTypes.label" default="Rel Ada Decision Types" /></span>
					
						<g:each in="${extraFieldInstance.relAdaDecisionTypes}" var="r">
						<span class="property-value" aria-labelledby="relAdaDecisionTypes-label"><g:link controller="type" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.relAdaConstrainedInOrganization}">
				<li class="fieldcontain">
					<span id="relAdaConstrainedInOrganization-label" class="property-label"><g:message code="extraField.relAdaConstrainedInOrganization.label" default="Rel Ada Constrained In Organization" /></span>
					
						<span class="property-value" aria-labelledby="relAdaConstrainedInOrganization-label"><g:formatBoolean boolean="${extraFieldInstance?.relAdaConstrainedInOrganization}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.nestedFields}">
				<li class="fieldcontain">
					<span id="nestedFields-label" class="property-label"><g:message code="extraField.nestedFields.label" default="Nested Fields" /></span>
					
						<g:each in="${extraFieldInstance.nestedFields}" var="n">
						<span class="property-value" aria-labelledby="nestedFields-label"><g:link controller="extraField" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.help}">
				<li class="fieldcontain">
					<span id="help-label" class="property-label"><g:message code="extraField.help.label" default="Help" /></span>
					
						<span class="property-value" aria-labelledby="help-label"><g:fieldValue bean="${extraFieldInstance}" field="help"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.label}">
				<li class="fieldcontain">
					<span id="label-label" class="property-label"><g:message code="extraField.label.label" default="Label" /></span>
					
						<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${extraFieldInstance}" field="label"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.maxLength}">
				<li class="fieldcontain">
					<span id="maxLength-label" class="property-label"><g:message code="extraField.maxLength.label" default="Max Length" /></span>
					
						<span class="property-value" aria-labelledby="maxLength-label"><g:fieldValue bean="${extraFieldInstance}" field="maxLength"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.multiple}">
				<li class="fieldcontain">
					<span id="multiple-label" class="property-label"><g:message code="extraField.multiple.label" default="Multiple" /></span>
					
						<span class="property-value" aria-labelledby="multiple-label"><g:formatBoolean boolean="${extraFieldInstance?.multiple}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.required}">
				<li class="fieldcontain">
					<span id="required-label" class="property-label"><g:message code="extraField.required.label" default="Required" /></span>
					
						<span class="property-value" aria-labelledby="required-label"><g:formatBoolean boolean="${extraFieldInstance?.required}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${extraFieldInstance?.searchTerm}">
				<li class="fieldcontain">
					<span id="searchTerm-label" class="property-label"><g:message code="extraField.searchTerm.label" default="Search Term" /></span>
					
						<span class="property-value" aria-labelledby="searchTerm-label"><g:fieldValue bean="${extraFieldInstance}" field="searchTerm"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:extraFieldInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${extraFieldInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
