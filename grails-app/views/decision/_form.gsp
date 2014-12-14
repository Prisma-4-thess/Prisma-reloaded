<%@ page import="com.meerkat.Decision" %>



<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'ada', 'error')} required">
	<label for="ada">
		<g:message code="decision.ada.label" default="Ada" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ada" required="" value="${decisionInstance?.ada}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'correctedDecision', 'error')} required">
	<label for="correctedDecision">
		<g:message code="decision.correctedDecision.label" default="Corrected Decision" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="correctedDecision" name="correctedDecision.id" from="${com.meerkat.Decision.list()}" optionKey="id" required="" value="${decisionInstance?.correctedDecision?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'extraFieldValues', 'error')} ">
	<label for="extraFieldValues">
		<g:message code="decision.extraFieldValues.label" default="Extra Field Values" />
		
	</label>
	<g:select name="extraFieldValues" from="${com.meerkat.ExtraFieldValue.list()}" multiple="multiple" optionKey="id" size="5" value="${decisionInstance?.extraFieldValues*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'geo', 'error')} required">
	<label for="geo">
		<g:message code="decision.geo.label" default="Geo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="geo" name="geo.id" from="${com.meerkat.Geo.list()}" optionKey="id" required="" value="${decisionInstance?.geo?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'issueDate', 'error')} required">
	<label for="issueDate">
		<g:message code="decision.issueDate.label" default="Issue Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="issueDate" type="number" value="${decisionInstance.issueDate}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'organization', 'error')} required">
	<label for="organization">
		<g:message code="decision.organization.label" default="Organization" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="organization" name="organization.id" from="${com.meerkat.Organization.list()}" optionKey="id" required="" value="${decisionInstance?.organization?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'privateData', 'error')} ">
	<label for="privateData">
		<g:message code="decision.privateData.label" default="Private Data" />
		
	</label>
	<g:checkBox name="privateData" value="${decisionInstance?.privateData}" />

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'protocolNumber', 'error')} required">
	<label for="protocolNumber">
		<g:message code="decision.protocolNumber.label" default="Protocol Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="protocolNumber" required="" value="${decisionInstance?.protocolNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'signers', 'error')} ">
	<label for="signers">
		<g:message code="decision.signers.label" default="Signers" />
		
	</label>
	<g:select name="signers" from="${com.meerkat.Signer.list()}" multiple="multiple" optionKey="id" size="5" value="${decisionInstance?.signers*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="decision.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subject" required="" value="${decisionInstance?.subject}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'submissionTimestamp', 'error')} required">
	<label for="submissionTimestamp">
		<g:message code="decision.submissionTimestamp.label" default="Submission Timestamp" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="submissionTimestamp" type="number" value="${decisionInstance.submissionTimestamp}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'thematicCategories', 'error')} ">
	<label for="thematicCategories">
		<g:message code="decision.thematicCategories.label" default="Thematic Categories" />
		
	</label>
	<g:select name="thematicCategories" from="${com.meerkat.DictionaryItem.list()}" multiple="multiple" optionKey="id" size="5" value="${decisionInstance?.thematicCategories*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="decision.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${com.meerkat.Type.list()}" optionKey="id" required="" value="${decisionInstance?.type?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'units', 'error')} ">
	<label for="units">
		<g:message code="decision.units.label" default="Units" />
		
	</label>
	<g:select name="units" from="${com.meerkat.Unit.list()}" multiple="multiple" optionKey="id" size="5" value="${decisionInstance?.units*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'versionId', 'error')} required">
	<label for="versionId">
		<g:message code="decision.versionId.label" default="Version Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="versionId" type="number" value="${decisionInstance.versionId}" required=""/>

</div>

