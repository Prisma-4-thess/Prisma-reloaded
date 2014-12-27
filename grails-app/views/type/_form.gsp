<%@ page import="com.meerkat.Type" %>



<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="type.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${typeInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'uid', 'error')} ">
	<label for="uid">
		<g:message code="type.uid.label" default="Uid" />
		
	</label>
	<g:textField name="uid" value="${typeInstance?.uid}"/>

</div>

