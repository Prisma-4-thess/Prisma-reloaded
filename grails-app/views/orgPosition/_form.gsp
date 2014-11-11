<%@ page import="com.meerkat.OrgPosition" %>



<div class="fieldcontain ${hasErrors(bean: orgPositionInstance, field: 'uid', 'error')} required">
	<label for="uid">
		<g:message code="orgPosition.uid.label" default="Uid" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="uid" required="" value="${orgPositionInstance?.uid}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: orgPositionInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="orgPosition.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${orgPositionInstance?.label}"/>

</div>

