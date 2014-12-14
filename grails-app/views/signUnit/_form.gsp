<%@ page import="com.meerkat.SignUnit" %>



<div class="fieldcontain ${hasErrors(bean: signUnitInstance, field: 'positionId', 'error')} required">
	<label for="positionId">
		<g:message code="signUnit.positionId.label" default="Position Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="positionId" name="positionId.id" from="${com.meerkat.OrgPosition.list()}" optionKey="id" required="" value="${signUnitInstance?.positionId?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signUnitInstance, field: 'positionLabel', 'error')} required">
	<label for="positionLabel">
		<g:message code="signUnit.positionLabel.label" default="Position Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="positionLabel" required="" value="${signUnitInstance?.positionLabel}"/>

</div>

