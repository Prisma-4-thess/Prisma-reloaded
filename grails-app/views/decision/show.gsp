
<%@ page import="com.meerkat.Decision" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'decision.label', default: 'Decision')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-decision" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-decision" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list decision">
			
				<g:if test="${decisionInstance?.ada}">
				<li class="fieldcontain">
					<span id="ada-label" class="property-label"><g:message code="decision.ada.label" default="Ada" /></span>
					
						<span class="property-value" aria-labelledby="ada-label"><g:fieldValue bean="${decisionInstance}" field="ada"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.correctedDecision}">
				<li class="fieldcontain">
					<span id="correctedDecision-label" class="property-label"><g:message code="decision.correctedDecision.label" default="Corrected Decision" /></span>
					
						<span class="property-value" aria-labelledby="correctedDecision-label"><g:link controller="decision" action="show" id="${decisionInstance?.correctedDecision?.id}">${decisionInstance?.correctedDecision?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.extraFieldValues}">
				<li class="fieldcontain">
					<span id="extraFieldValues-label" class="property-label"><g:message code="decision.extraFieldValues.label" default="Extra Field Values" /></span>
					
						<g:each in="${decisionInstance.extraFieldValues}" var="e">
						<span class="property-value" aria-labelledby="extraFieldValues-label"><g:link controller="extraFieldValue" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.geo}">
				<li class="fieldcontain">
					<span id="geo-label" class="property-label"><g:message code="decision.geo.label" default="Geo" /></span>
					
						<span class="property-value" aria-labelledby="geo-label"><g:link controller="geo" action="show" id="${decisionInstance?.geo?.id}">${decisionInstance?.geo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.issueDate}">
				<li class="fieldcontain">
					<span id="issueDate-label" class="property-label"><g:message code="decision.issueDate.label" default="Issue Date" /></span>
					
						<span class="property-value" aria-labelledby="issueDate-label"><g:fieldValue bean="${decisionInstance}" field="issueDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.organization}">
				<li class="fieldcontain">
					<span id="organization-label" class="property-label"><g:message code="decision.organization.label" default="Organization" /></span>
					
						<span class="property-value" aria-labelledby="organization-label"><g:link controller="organization" action="show" id="${decisionInstance?.organization?.id}">${decisionInstance?.organization?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.privateData}">
				<li class="fieldcontain">
					<span id="privateData-label" class="property-label"><g:message code="decision.privateData.label" default="Private Data" /></span>
					
						<span class="property-value" aria-labelledby="privateData-label"><g:formatBoolean boolean="${decisionInstance?.privateData}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.protocolNumber}">
				<li class="fieldcontain">
					<span id="protocolNumber-label" class="property-label"><g:message code="decision.protocolNumber.label" default="Protocol Number" /></span>
					
						<span class="property-value" aria-labelledby="protocolNumber-label"><g:fieldValue bean="${decisionInstance}" field="protocolNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.signers}">
				<li class="fieldcontain">
					<span id="signers-label" class="property-label"><g:message code="decision.signers.label" default="Signers" /></span>
					
						<g:each in="${decisionInstance.signers}" var="s">
						<span class="property-value" aria-labelledby="signers-label"><g:link controller="signer" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="decision.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${decisionInstance}" field="subject"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.submissionTimestamp}">
				<li class="fieldcontain">
					<span id="submissionTimestamp-label" class="property-label"><g:message code="decision.submissionTimestamp.label" default="Submission Timestamp" /></span>
					
						<span class="property-value" aria-labelledby="submissionTimestamp-label"><g:fieldValue bean="${decisionInstance}" field="submissionTimestamp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.thematicCategories}">
				<li class="fieldcontain">
					<span id="thematicCategories-label" class="property-label"><g:message code="decision.thematicCategories.label" default="Thematic Categories" /></span>
					
						<g:each in="${decisionInstance.thematicCategories}" var="t">
						<span class="property-value" aria-labelledby="thematicCategories-label"><g:link controller="dictionaryItem" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="decision.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="type" action="show" id="${decisionInstance?.type?.id}">${decisionInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.units}">
				<li class="fieldcontain">
					<span id="units-label" class="property-label"><g:message code="decision.units.label" default="Units" /></span>
					
						<g:each in="${decisionInstance.units}" var="u">
						<span class="property-value" aria-labelledby="units-label"><g:link controller="unit" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${decisionInstance?.versionId}">
				<li class="fieldcontain">
					<span id="versionId-label" class="property-label"><g:message code="decision.versionId.label" default="Version Id" /></span>
					
						<span class="property-value" aria-labelledby="versionId-label"><g:fieldValue bean="${decisionInstance}" field="versionId"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:decisionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${decisionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
