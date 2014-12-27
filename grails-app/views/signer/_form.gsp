<%@ page import="com.meerkat.Signer" %>



<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'uid', 'error')} ">
	<label for="uid">
		<g:message code="signer.uid.label" default="Uid" />
		
	</label>
	<g:textField name="uid" value="${signerInstance?.uid}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="signer.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${signerInstance?.active}" />

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'activeFrom', 'error')} ">
	<label for="activeFrom">
		<g:message code="signer.activeFrom.label" default="Active From" />
		
	</label>
	<g:field name="activeFrom" type="number" value="${signerInstance.activeFrom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'activeUntil', 'error')} ">
	<label for="activeUntil">
		<g:message code="signer.activeUntil.label" default="Active Until" />
		
	</label>
	<g:field name="activeUntil" type="number" value="${signerInstance.activeUntil}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="signer.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${signerInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="signer.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${signerInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: signerInstance, field: 'org', 'error')} ">
	<label for="org">
		<g:message code="signer.org.label" default="Org" />
		
	</label>
	<g:select id="org" name="org.id" from="${com.meerkat.Organization.list()}" optionKey="id" value="${signerInstance?.org?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

