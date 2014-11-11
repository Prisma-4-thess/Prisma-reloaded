<%@ page import="com.meerkat.ExtraField" %>



<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="extraField.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${extraFieldInstance.constraints.type.inList}" required="" value="${extraFieldInstance?.type}" valueMessagePrefix="extraField.type"/>

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'validation', 'error')} required">
	<label for="validation">
		<g:message code="extraField.validation.label" default="Validation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="validation" from="${extraFieldInstance.constraints.validation.inList}" required="" value="${extraFieldInstance?.validation}" valueMessagePrefix="extraField.validation"/>

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'dictionary', 'error')} ">
	<label for="dictionary">
		<g:message code="extraField.dictionary.label" default="Dictionary" />
		
	</label>
	<g:textField name="dictionary" value="${extraFieldInstance?.dictionary}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'fixedValueList', 'error')} ">
	<label for="fixedValueList">
		<g:message code="extraField.fixedValueList.label" default="Fixed Value List" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'relAdaDecisionTypes', 'error')} ">
	<label for="relAdaDecisionTypes">
		<g:message code="extraField.relAdaDecisionTypes.label" default="Rel Ada Decision Types" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'relAdaConstrainedInOrganization', 'error')} ">
	<label for="relAdaConstrainedInOrganization">
		<g:message code="extraField.relAdaConstrainedInOrganization.label" default="Rel Ada Constrained In Organization" />
		
	</label>
	<g:checkBox name="relAdaConstrainedInOrganization" value="${extraFieldInstance?.relAdaConstrainedInOrganization}" />

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'nestedFields', 'error')} ">
	<label for="nestedFields">
		<g:message code="extraField.nestedFields.label" default="Nested Fields" />
		
	</label>
	<g:select name="nestedFields" from="${com.meerkat.ExtraField.list()}" multiple="multiple" optionKey="id" size="5" value="${extraFieldInstance?.nestedFields*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'help', 'error')} required">
	<label for="help">
		<g:message code="extraField.help.label" default="Help" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="help" required="" value="${extraFieldInstance?.help}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="extraField.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${extraFieldInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'maxLength', 'error')} required">
	<label for="maxLength">
		<g:message code="extraField.maxLength.label" default="Max Length" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxLength" type="number" value="${extraFieldInstance.maxLength}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'multiple', 'error')} ">
	<label for="multiple">
		<g:message code="extraField.multiple.label" default="Multiple" />
		
	</label>
	<g:checkBox name="multiple" value="${extraFieldInstance?.multiple}" />

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'required', 'error')} ">
	<label for="required">
		<g:message code="extraField.required.label" default="Required" />
		
	</label>
	<g:checkBox name="required" value="${extraFieldInstance?.required}" />

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'searchTerm', 'error')} required">
	<label for="searchTerm">
		<g:message code="extraField.searchTerm.label" default="Search Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="searchTerm" required="" value="${extraFieldInstance?.searchTerm}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'uid', 'error')} required">
	<label for="uid">
		<g:message code="extraField.uid.label" default="Uid" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="uid" required="" value="${extraFieldInstance?.uid}"/>

</div>

