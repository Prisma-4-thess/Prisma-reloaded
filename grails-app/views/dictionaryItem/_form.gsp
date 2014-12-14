<%@ page import="com.meerkat.DictionaryItem" %>



<div class="fieldcontain ${hasErrors(bean: dictionaryItemInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="dictionaryItem.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${dictionaryItemInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dictionaryItemInstance, field: 'parent', 'error')} ">
	<label for="parent">
		<g:message code="dictionaryItem.parent.label" default="Parent" />
		
	</label>
	<g:select id="parent" name="parent.id" from="${com.meerkat.DictionaryItem.list()}" optionKey="id" value="${dictionaryItemInstance?.parent?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dictionaryItemInstance, field: 'dictionary', 'error')} required">
	<label for="dictionary">
		<g:message code="dictionaryItem.dictionary.label" default="Dictionary" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dictionary" name="dictionary.id" from="${com.meerkat.Dictionary.list()}" optionKey="id" required="" value="${dictionaryItemInstance?.dictionary?.id}" class="many-to-one"/>

</div>

