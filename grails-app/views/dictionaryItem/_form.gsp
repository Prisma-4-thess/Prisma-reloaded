<%@ page import="com.meerkat.DictionaryItem" %>



<div class="fieldcontain ${hasErrors(bean: dictionaryItemInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="dictionaryItem.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${dictionaryItemInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dictionaryItemInstance, field: 'uid', 'error')} ">
	<label for="uid">
		<g:message code="dictionaryItem.uid.label" default="Uid" />
		
	</label>
	<g:textField name="uid" value="${dictionaryItemInstance?.uid}"/>

</div>

