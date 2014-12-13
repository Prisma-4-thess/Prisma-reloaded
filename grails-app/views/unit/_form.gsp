<%@ page import="com.meerkat.Unit" %>



<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="unit.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" from="${com.meerkat.Organization.list()}" optionKey="id" required="" value="${unitInstance?.parent?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'abbreviation', 'error')} required">
	<label for="abbreviation">
		<g:message code="unit.abbreviation.label" default="Abbreviation" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="abbreviation" required="" value="${unitInstance?.abbreviation}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="unit.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${unitInstance?.active}" />

</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="unit.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.meerkat.DictionaryItem.list()}" optionKey="id" required="" value="${unitInstance?.category?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="unit.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${unitInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'unitDomains', 'error')} ">
	<label for="unitDomains">
		<g:message code="unit.unitDomains.label" default="Unit Domains" />
		
	</label>
	<g:select name="unitDomains" from="${com.meerkat.DictionaryItem.list()}" multiple="multiple" optionKey="id" size="5" value="${unitInstance?.unitDomains*.id}" class="many-to-many"/>

</div>

