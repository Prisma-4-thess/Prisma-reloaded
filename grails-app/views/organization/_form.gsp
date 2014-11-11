<%@ page import="com.meerkat.Organization" %>



<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'uid', 'error')} required">
	<label for="uid">
		<g:message code="organization.uid.label" default="Uid" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="uid" required="" value="${organizationInstance?.uid}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="organization.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${organizationInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'odeManagerEmail', 'error')} required">
	<label for="odeManagerEmail">
		<g:message code="organization.odeManagerEmail.label" default="Ode Manager Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="odeManagerEmail" required="" value="${organizationInstance?.odeManagerEmail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'website', 'error')} required">
	<label for="website">
		<g:message code="organization.website.label" default="Website" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="website" required="" value="${organizationInstance?.website}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'fekIssue', 'error')} required">
	<label for="fekIssue">
		<g:message code="organization.fekIssue.label" default="Fek Issue" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fekIssue" type="number" value="${organizationInstance.fekIssue}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'vatNumber', 'error')} ">
	<label for="vatNumber">
		<g:message code="organization.vatNumber.label" default="Vat Number" />
		
	</label>
	<g:textField name="vatNumber" value="${organizationInstance?.vatNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'supervisor', 'error')} ">
	<label for="supervisor">
		<g:message code="organization.supervisor.label" default="Supervisor" />
		
	</label>
	<g:select id="supervisor" name="supervisor.id" from="${com.meerkat.Organization.list()}" optionKey="id" value="${organizationInstance?.supervisor?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="organization.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${organizationInstance.constraints.status.inList}" required="" value="${organizationInstance?.status}" valueMessagePrefix="organization.status"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'abbreviation', 'error')} required">
	<label for="abbreviation">
		<g:message code="organization.abbreviation.label" default="Abbreviation" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="abbreviation" required="" value="${organizationInstance?.abbreviation}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="organization.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.meerkat.DictionaryItem.list()}" optionKey="id" required="" value="${organizationInstance?.category?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'fekNumber', 'error')} required">
	<label for="fekNumber">
		<g:message code="organization.fekNumber.label" default="Fek Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fekNumber" type="number" value="${organizationInstance.fekNumber}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'fekYear', 'error')} required">
	<label for="fekYear">
		<g:message code="organization.fekYear.label" default="Fek Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fekYear" type="number" value="${organizationInstance.fekYear}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'latinName', 'error')} required">
	<label for="latinName">
		<g:message code="organization.latinName.label" default="Latin Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="latinName" required="" value="${organizationInstance?.latinName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'orgDomain', 'error')} ">
	<label for="orgDomain">
		<g:message code="organization.orgDomain.label" default="Org Domain" />
		
	</label>
	<g:select name="orgDomain" from="${com.meerkat.DictionaryItem.list()}" multiple="multiple" optionKey="id" size="5" value="${organizationInstance?.orgDomain*.id}" class="many-to-many"/>

</div>

