<%@ page import="com.meerkat.Decision" %>



<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'issueDate', 'error')} required">
	<label for="issueDate">
		<g:message code="decision.issueDate.label" default="Issue Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="issueDate" type="number" value="${decisionInstance.issueDate}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'ada', 'error')} ">
	<label for="ada">
		<g:message code="decision.ada.label" default="Ada" />
		
	</label>
	<g:textField name="ada" value="${decisionInstance?.ada}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'correctedVersionId', 'error')} ">
	<label for="correctedVersionId">
		<g:message code="decision.correctedVersionId.label" default="Corrected Version Id" />
		
	</label>
	<g:textField name="correctedVersionId" value="${decisionInstance?.correctedVersionId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'extraFields', 'error')} ">
	<label for="extraFields">
		<g:message code="decision.extraFields.label" default="Extra Fields" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${decisionInstance?.extraFields?}" var="e">
    <li><g:link controller="extraField" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="extraField" action="create" params="['decision.id': decisionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'extraField.label', default: 'ExtraField')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'geo', 'error')} ">
	<label for="geo">
		<g:message code="decision.geo.label" default="Geo" />
		
	</label>
	<g:select id="geo" name="geo.id" from="${com.meerkat.Geo.list()}" optionKey="id" value="${decisionInstance?.geo?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'protocolNumber', 'error')} ">
	<label for="protocolNumber">
		<g:message code="decision.protocolNumber.label" default="Protocol Number" />
		
	</label>
	<g:textField name="protocolNumber" value="${decisionInstance?.protocolNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'signers', 'error')} ">
	<label for="signers">
		<g:message code="decision.signers.label" default="Signers" />
		
	</label>
	<g:select name="signers" from="${com.meerkat.Signer.list()}" multiple="multiple" optionKey="id" size="5" value="${decisionInstance?.signers*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="decision.subject.label" default="Subject" />
		
	</label>
	<g:textField name="subject" value="${decisionInstance?.subject}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'thematic_cat', 'error')} ">
	<label for="thematic_cat">
		<g:message code="decision.thematic_cat.label" default="Thematiccat" />
		
	</label>
	<g:select name="thematic_cat" from="${com.meerkat.DictionaryItem.list()}" multiple="multiple" optionKey="id" size="5" value="${decisionInstance?.thematic_cat*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="decision.type.label" default="Type" />
		
	</label>
	<g:select id="type" name="type.id" from="${com.meerkat.Type.list()}" optionKey="id" value="${decisionInstance?.type?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'units', 'error')} ">
	<label for="units">
		<g:message code="decision.units.label" default="Units" />
		
	</label>
	<g:select name="units" from="${com.meerkat.Unit.list()}" multiple="multiple" optionKey="id" size="5" value="${decisionInstance?.units*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: decisionInstance, field: 'versionId', 'error')} ">
	<label for="versionId">
		<g:message code="decision.versionId.label" default="Version Id" />
		
	</label>
	<g:textField name="versionId" value="${decisionInstance?.versionId}"/>

</div>

