<%@ page import="com.meerkat.Unit" %>



<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'uid', 'error')} ">
	<label for="uid">
		<g:message code="unit.uid.label" default="Uid" />
		
	</label>
	<g:textField name="uid" value="${unitInstance?.uid}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="unit.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${unitInstance?.active}" />

</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'geo', 'error')} ">
	<label for="geo">
		<g:message code="unit.geo.label" default="Geo" />
		
	</label>
	<g:select id="geo" name="geo.id" from="${com.meerkat.Geo.list()}" optionKey="id" value="${unitInstance?.geo?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'label', 'error')} ">
	<label for="label">
		<g:message code="unit.label.label" default="Label" />
		
	</label>
	<g:textField name="label" value="${unitInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: unitInstance, field: 'parent', 'error')} ">
	<label for="parent">
		<g:message code="unit.parent.label" default="Parent" />
		
	</label>
	<g:select id="parent" name="parent.id" from="${com.meerkat.Organization.list()}" optionKey="id" value="${unitInstance?.parent?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

