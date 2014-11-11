<%@ page import="com.meerkat.Dictionary" %>



<div class="fieldcontain ${hasErrors(bean: dictionaryInstance, field: 'uid', 'error')} required">
	<label for="uid">
		<g:message code="dictionary.uid.label" default="Uid" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="uid" required="" value="${dictionaryInstance?.uid}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dictionaryInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="dictionary.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${dictionaryInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dictionaryInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="dictionary.items.label" default="Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${dictionaryInstance?.items?}" var="i">
    <li><g:link controller="dictionaryItem" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="dictionaryItem" action="create" params="['dictionary.id': dictionaryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'dictionaryItem.label', default: 'DictionaryItem')])}</g:link>
</li>
</ul>


</div>

