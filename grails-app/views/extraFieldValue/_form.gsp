<%@ page import="com.meerkat.ExtraFieldValue" %>



<div class="fieldcontain ${hasErrors(bean: extraFieldValueInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="extraFieldValue.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="value" required="" value="${extraFieldValueInstance?.value}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: extraFieldValueInstance, field: 'ownerExtraField', 'error')} required">
	<label for="ownerExtraField">
		<g:message code="extraFieldValue.ownerExtraField.label" default="Owner Extra Field" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ownerExtraField" name="ownerExtraField.id" from="${com.meerkat.ExtraField.list()}" optionKey="id" required="" value="${extraFieldValueInstance?.ownerExtraField?.id}" class="many-to-one"/>

</div>

