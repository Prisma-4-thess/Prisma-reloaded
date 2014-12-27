%{--This should show the contents of one Unit--}%
%{--parameters: unitInstance--}%

<div id="show-unit" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /> <g:fieldValue bean="${unitInstance}" field="label"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list unit">

        <g:if test="${unitInstance?.uid}">
            <li class="fieldcontain">
                <span id="uid-label" class="property-label"><g:message code="unit.uid.label" default="Uid" /></span>

                <span class="property-value" aria-labelledby="uid-label"><g:fieldValue bean="${unitInstance}" field="uid"/></span>

            </li>
        </g:if>

        <g:if test="${unitInstance?.active}">
            <li class="fieldcontain">
                <span id="active-label" class="property-label"><g:message code="unit.active.label" default="Active" /></span>

                <span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${unitInstance?.active}" /></span>

            </li>
        </g:if>

        <g:if test="${unitInstance?.geo}">
            <li class="fieldcontain">
                <span id="geo-label" class="property-label"><g:message code="unit.geo.label" default="Geo" /></span>

                <span class="property-value" aria-labelledby="geo-label"><g:link controller="geo" action="show" id="${unitInstance?.geo?.id}">${unitInstance?.geo?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${unitInstance?.label}">
            <li class="fieldcontain">
                <span id="label-label" class="property-label"><g:message code="unit.label.label" default="Label" /></span>

                <span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${unitInstance}" field="label"/></span>

            </li>
        </g:if>

        <g:if test="${unitInstance?.parent}">
            <li class="fieldcontain">
                <span id="parent-label" class="property-label"><g:message code="unit.parent.label" default="Parent" /></span>

                <span class="property-value" aria-labelledby="parent-label"><g:link controller="organization" action="show" id="${unitInstance?.parent?.id}">${unitInstance?.parent?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource:unitInstance, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${unitInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>