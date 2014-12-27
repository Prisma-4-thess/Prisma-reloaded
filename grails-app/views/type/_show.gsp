%{--This should show the contents of one Type--}%
%{--parameters: typeInstance--}%

<div id="show-type" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /> <g:fieldValue bean="${typeInstance}" field="label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list type">

        <g:if test="${typeInstance?.label}">
            <li class="fieldcontain">
                <span id="label-label" class="property-label"><g:message code="type.label.label" default="Label" /></span>

                <span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${typeInstance}" field="label"/></span>

            </li>
        </g:if>

        <g:if test="${typeInstance?.uid}">
            <li class="fieldcontain">
                <span id="uid-label" class="property-label"><g:message code="type.uid.label" default="Uid" /></span>

                <span class="property-value" aria-labelledby="uid-label"><g:fieldValue bean="${typeInstance}" field="uid"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource:typeInstance, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${typeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>