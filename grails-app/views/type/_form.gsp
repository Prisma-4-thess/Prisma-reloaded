<%@ page import="com.meerkat.Type" %>



<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'allowedInDecision', 'error')} ">
	<label for="allowedInDecision">
		<g:message code="type.allowedInDecision.label" default="Allowed In Decision" />
		
	</label>
	<g:checkBox name="allowedInDecision" value="${typeInstance?.allowedInDecision}" />

</div>

<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'extraFields', 'error')} ">
	<label for="extraFields">
		<g:message code="type.extraFields.label" default="Extra Fields" />
		
	</label>
	<g:select name="extraFields" from="${com.meerkat.ExtraField.list()}" multiple="multiple" optionKey="id" size="5" value="${typeInstance?.extraFields*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="type.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${typeInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="type.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" from="${com.meerkat.Type.list()}" optionKey="id" required="" value="${typeInstance?.parent?.id}" class="many-to-one"/>

</div>

