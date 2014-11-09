<%@ page import="com.meerkat.OrgPosition" %>



<div class="fieldcontain ${hasErrors(bean: orgPositionInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="orgPosition.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${orgPositionInstance?.label}"/>

</div>

