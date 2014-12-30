%{--This should show the contents of one Signer--}%
%{--parameters: signerInstance--}%

<div id="show-signer" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table class="table table-hover">
        <thead>
        <tr class="info">
            <th>
                <g:if test="${signerInstance?.active}">
                    <g:message code="signer.active.label" default="Active"/>
                </g:if>
            </th>
            <th>
                <g:if test="${signerInstance?.activeFrom}">
                    <g:message code="signer.activeFrom.label" default="Active From"/>
                </g:if>
            </th>
            <th>
                <g:if test="${signerInstance?.activeUntil}">
                    <g:message code="signer.activeUntil.label" default="Active Until"/>
                </g:if>
            </th>
            <th>
                <g:if test="${signerInstance?.org}">
                    <g:message code="signer.org.label" default="Organization"/>
                </g:if>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <g:if test="${signerInstance?.active}">
                    <g:formatBoolean boolean="${signerInstance?.active}"/>
                </g:if>
            </td>
            <td>
                <g:if test="${signerInstance?.activeFrom}">
                    <g:fieldValue bean="${signerInstance}" field="activeFrom"/>
                </g:if>
            </td>
            <td>
                <g:if test="${signerInstance?.activeUntil}">
                    <g:fieldValue bean="${signerInstance}" field="activeUntil"/>
                </g:if>
            </td>

            <td>
                <g:if test="${signerInstance?.org}">
                    <g:fieldValue bean="${signerInstance}" field="org"/>
                </g:if>
            </td>
        </tr>
        </tbody>
    </table>


%{--
    <ol class="property-list signer">

        <g:if test="${signerInstance?.uid}">
            <li class="fieldcontain">
                <span id="uid-label" class="property-label"><g:message code="signer.uid.label" default="Uid"/></span>

                <span class="property-value" aria-labelledby="uid-label"><g:fieldValue bean="${signerInstance}" field="uid"/></span>

            </li>
        </g:if>

        <g:if test="${signerInstance?.active}">
            <li class="fieldcontain">
                <span id="active-label" class="property-label"><g:message code="signer.active.label" default="Active"/></span>

                <span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${signerInstance?.active}"/></span>

            </li>
        </g:if>

        <g:if test="${signerInstance?.activeFrom}">
            <li class="fieldcontain">
                <span id="activeFrom-label" class="property-label"><g:message code="signer.activeFrom.label" default="Active From"/></span>

                <span class="property-value" aria-labelledby="activeFrom-label"><g:fieldValue bean="${signerInstance}" field="activeFrom"/></span>

            </li>
        </g:if>

        <g:if test="${signerInstance?.activeUntil}">
            <li class="fieldcontain">
                <span id="activeUntil-label" class="property-label"><g:message code="signer.activeUntil.label" default="Active Until"/></span>

                <span class="property-value" aria-labelledby="activeUntil-label"><g:fieldValue bean="${signerInstance}" field="activeUntil"/></span>

            </li>
        </g:if>

        <g:if test="${signerInstance?.firstName}">
            <li class="fieldcontain">
                <span id="firstName-label" class="property-label"><g:message code="signer.firstName.label" default="First Name"/></span>

                <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${signerInstance}" field="firstName"/></span>

            </li>
        </g:if>

        <g:if test="${signerInstance?.lastName}">
            <li class="fieldcontain">
                <span id="lastName-label" class="property-label"><g:message code="signer.lastName.label" default="Last Name"/></span>

                <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${signerInstance}" field="lastName"/></span>

            </li>
        </g:if>

        <g:if test="${signerInstance?.org}">
            <li class="fieldcontain">
                <span id="org-label" class="property-label"><g:message code="signer.org.label" default="Org"/></span>

                <span class="property-value" aria-labelledby="org-label"><g:link controller="organization" action="show"
                                                                                 id="${signerInstance?.org?.id}">${signerInstance?.org?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>--}%
</div>