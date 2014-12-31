%{--This should show the contents of one Type--}%
%{--parameters: typeInstance--}%

<div id="show-type" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table class="table table-hover">
        <thead>
        <tr class="palette-silver">
            <th>
                <g:if test="${typeInstance?.label}">
                    <g:message code="type.label.label" default="Label"/>
                </g:if>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <g:if test="${typeInstance?.label}">
                    <g:fieldValue bean="${typeInstance}" field="label"/>
                </g:if>
            </td>

        </tr>
        </tbody>
    </table>


%{--


    <ol class="property-list type">

        <g:if test="${typeInstance?.label}">
            <li class="fieldcontain">
                <span id="label-label" class="property-label"><g:message code="type.label.label" default="Label"/></span>

                <span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${typeInstance}" field="label"/></span>

            </li>
        </g:if>

        <g:if test="${typeInstance?.uid}">
            <li class="fieldcontain">
                <span id="uid-label" class="property-label"><g:message code="type.uid.label" default="Uid"/></span>

                <span class="property-value" aria-labelledby="uid-label"><g:fieldValue bean="${typeInstance}" field="uid"/></span>

            </li>
        </g:if>

    </ol>--}%
</div>