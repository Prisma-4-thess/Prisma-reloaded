<%@ page import="com.meerkat.ExtraField" %>



<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'extra_field_name', 'error')} required">
	<label for="extra_field_name">
		<g:message code="extraField.extra_field_name.label" default="Extrafieldname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="extra_field_name" required="" value="${extraFieldInstance?.extra_field_name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'extra_field_value', 'error')} required">
	<label for="extra_field_value">
		<g:message code="extraField.extra_field_value.label" default="Extrafieldvalue" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="extra_field_value" required="" value="${extraFieldInstance?.extra_field_value}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldInstance, field: 'decision', 'error')} required">
	<label for="decision">
		<g:message code="extraField.decision.label" default="Decision" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="decision" name="decision.id" from="${com.meerkat.Decision.list()}" optionKey="id" required="" value="${extraFieldInstance?.decision?.id}" class="many-to-one"/>

</div>

