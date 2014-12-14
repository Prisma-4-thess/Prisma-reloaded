<%@ page import="com.meerkat.Signer" %>



<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="signer.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${signerInstance?.active}" />

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'activeFrom', 'error')} required">
	<label for="activeFrom">
		<g:message code="signer.activeFrom.label" default="Active From" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="activeFrom" type="number" value="${signerInstance.activeFrom}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'activeUntil', 'error')} required">
	<label for="activeUntil">
		<g:message code="signer.activeUntil.label" default="Active Until" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="activeUntil" type="number" value="${signerInstance.activeUntil}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="signer.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${signerInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'hasOrganizationSignRights', 'error')} ">
	<label for="hasOrganizationSignRights">
		<g:message code="signer.hasOrganizationSignRights.label" default="Has Organization Sign Rights" />
		
	</label>
	<g:checkBox name="hasOrganizationSignRights" value="${signerInstance?.hasOrganizationSignRights}" />

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="signer.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${signerInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'org', 'error')} required">
	<label for="org">
		<g:message code="signer.org.label" default="Org" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="org" name="org.id" from="${com.meerkat.Organization.list()}" optionKey="id" required="" value="${signerInstance?.org?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'signUnits', 'error')} ">
	<label for="signUnits">
		<g:message code="signer.signUnits.label" default="Sign Units" />
		
	</label>
	<g:select name="signUnits" from="${com.meerkat.SignUnit.list()}" multiple="multiple" optionKey="id" size="5" value="${signerInstance?.signUnits*.id}" class="many-to-many"/>

</div>

