<%@ page import="com.meerkat.Signer" %>



<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="signer.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${signerInstance?.active}" />

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="signer.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${signerInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'hasOrganizatioSignRights', 'error')} ">
	<label for="hasOrganizatioSignRights">
		<g:message code="signer.hasOrganizatioSignRights.label" default="Has Organizatio Sign Rights" />
		
	</label>
	<g:checkBox name="hasOrganizatioSignRights" value="${signerInstance?.hasOrganizatioSignRights}" />

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

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'position', 'error')} required">
	<label for="position">
		<g:message code="signer.position.label" default="Position" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="position" name="position.id" from="${com.meerkat.OrgPosition.list()}" optionKey="id" required="" value="${signerInstance?.position?.id}" class="many-to-one"/>

</div>

