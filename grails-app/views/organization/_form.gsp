<%@ page import="com.meerkat.Organization" %>



<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="organization.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${organizationInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'uid', 'error')} ">
	<label for="uid">
		<g:message code="organization.uid.label" default="Uid" />
		
	</label>
	<g:textField name="uid" value="${organizationInstance?.uid}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'odeManagerEmail', 'error')} ">
	<label for="odeManagerEmail">
		<g:message code="organization.odeManagerEmail.label" default="Ode Manager Email" />
		
	</label>
	<g:textField name="odeManagerEmail" value="${organizationInstance?.odeManagerEmail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="organization.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${organizationInstance?.status}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'vatNumber', 'error')} ">
	<label for="vatNumber">
		<g:message code="organization.vatNumber.label" default="Vat Number" />
		
	</label>
	<g:textField name="vatNumber" value="${organizationInstance?.vatNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'website', 'error')} ">
	<label for="website">
		<g:message code="organization.website.label" default="Website" />
		
	</label>
	<g:textField name="website" value="${organizationInstance?.website}"/>

</div>

