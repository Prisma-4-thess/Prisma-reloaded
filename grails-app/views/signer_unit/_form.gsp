<%@ page import="com.meerkat.Signer_unit" %>



<div class="fieldcontain ${hasErrors(bean: signer_unitInstance, field: 'signer', 'error')} ">
	<label for="signer">
		<g:message code="signer_unit.signer.label" default="Signer" />
		
	</label>
	<g:select id="signer" name="signer.id" from="${com.meerkat.Signer.list()}" optionKey="id" value="${signer_unitInstance?.signer?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signer_unitInstance, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="signer_unit.position.label" default="Position" />
		
	</label>
	<g:textField name="position" value="${signer_unitInstance?.position}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signer_unitInstance, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="signer_unit.unit.label" default="Unit" />
		
	</label>
	<g:select id="unit" name="unit.id" from="${com.meerkat.Unit.list()}" optionKey="id" value="${signer_unitInstance?.unit?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

