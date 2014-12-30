%{--This should show the contents of one decision--}%
%{--parameters: decisionInstance--}%

<div id="show-decision" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table class="table table-hover">
        <thead>
        <tr class="info">
            <th>
                <g:if test="${decisionInstance?.issueDate}">
                    <g:message code="decision.issueDate.label" default="Issue Date"/>
                </g:if>
            </th>
            <th>
                <g:if test="${decisionInstance?.thematic_cat}">
                    <g:message code="decision.thematic_cat.label" default="Thematic Category"/>
                </g:if>
            </th>
            <th>
                <g:if test="${decisionInstance?.type}">
                    <g:message code="decision.type.label" default="Type"/>
                </g:if>
            </th>
            <th>
                <g:if test="${decisionInstance?.units}">
                    <g:message code="decision.units.label" default="Units"/>
                </g:if>
            </th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td>
                <g:if test="${decisionInstance?.issueDate}">
                    <g:fieldValue bean="${decisionInstance}" field="issueDate"/>
                </g:if>
            </td>

            <td>
                <g:if test="${decisionInstance?.thematic_cat}">
                    <g:each in="${decisionInstance.thematic_cat}">
                        ${it}
                    </g:each>
                </g:if>
            </td>
            <td>
                <g:if test="${decisionInstance?.type}">
                    <g:fieldValue bean="${decisionInstance}" field="type"/>
                </g:if>
            </td>
            <td>
                <g:if test="${decisionInstance?.units}">
                    <g:each in="${decisionInstance.units}" var="u">
                        ${u}
                    </g:each>
                </g:if>
            </td>
        </tr>
        </tbody>
    </table>



    %{--
        <ol class="property-list decision">

            <g:if test="${decisionInstance?.issueDate}">
                <li class="fieldcontain">
                    <span id="issueDate-label" class="property-label"><g:message code="decision.issueDate.label" default="Issue Date"/></span>

                    <span class="property-value" aria-labelledby="issueDate-label"><g:fieldValue bean="${decisionInstance}" field="issueDate"/></span>

                </li>
            </g:if>

            <g:if test="${decisionInstance?.ada}">
                <li class="fieldcontain">
                    <span id="ada-label" class="property-label"><g:message code="decision.ada.label" default="Ada"/></span>

                    <span class="property-value" aria-labelledby="ada-label"><g:fieldValue bean="${decisionInstance}" field="ada"/></span>

                </li>
            </g:if>

            <g:if test="${decisionInstance?.correctedVersionId}">
                <li class="fieldcontain">
                    <span id="correctedVersionId-label" class="property-label"><g:message code="decision.correctedVersionId.label" default="Corrected Version Id"/></span>

                    <span class="property-value" aria-labelledby="correctedVersionId-label"><g:fieldValue bean="${decisionInstance}" field="correctedVersionId"/></span>

                </li>
            </g:if>

            <g:if test="${decisionInstance?.extraFields}">
                <li class="fieldcontain">
                    <span id="extraFields-label" class="property-label"><g:message code="decision.extraFields.label" default="Extra Fields"/></span>

                    <g:each in="${decisionInstance.extraFields}" var="e">
                        <span class="property-value" aria-labelledby="extraFields-label"><g:link controller="extraField" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
                    </g:each>

                </li>
            </g:if>

            <g:if test="${decisionInstance?.geo}">
                <li class="fieldcontain">
                    <span id="geo-label" class="property-label"><g:message code="decision.geo.label" default="Geo"/></span>

                    <span class="property-value" aria-labelledby="geo-label"><g:link controller="geo" action="show"
                                                                                     id="${decisionInstance?.geo?.id}">${decisionInstance?.geo?.encodeAsHTML()}</g:link></span>

                </li>
            </g:if>

            <g:if test="${decisionInstance?.protocolNumber}">
                <li class="fieldcontain">
                    <span id="protocolNumber-label" class="property-label"><g:message code="decision.protocolNumber.label" default="Protocol Number"/></span>

                    <span class="property-value" aria-labelledby="protocolNumber-label"><g:fieldValue bean="${decisionInstance}" field="protocolNumber"/></span>

                </li>
            </g:if>

            <g:if test="${decisionInstance?.signers}">
                <li class="fieldcontain">
                    <span id="signers-label" class="property-label"><g:message code="decision.signers.label" default="Signers"/></span>

                    <g:each in="${decisionInstance.signers}" var="s">
                        <span class="property-value" aria-labelledby="signers-label"><g:link controller="signer" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
                    </g:each>

                </li>
            </g:if>

            <g:if test="${decisionInstance?.subject}">
                <li class="fieldcontain">
                    <span id="subject-label" class="property-label"><g:message code="decision.subject.label" default="Subject"/></span>

                    <span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${decisionInstance}" field="subject"/></span>

                </li>
            </g:if>

            <g:if test="${decisionInstance?.thematic_cat}">
                <li class="fieldcontain">
                    <span id="thematic_cat-label" class="property-label"><g:message code="decision.thematic_cat.label" default="Thematiccat"/></span>

                    <g:each in="${decisionInstance.thematic_cat}" var="t">
                        <span class="property-value" aria-labelledby="thematic_cat-label"><g:link controller="dictionaryItem" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
                    </g:each>

                </li>
            </g:if>

            <g:if test="${decisionInstance?.type}">
                <li class="fieldcontain">
                    <span id="type-label" class="property-label"><g:message code="decision.type.label" default="Type"/></span>

                    <span class="property-value" aria-labelledby="type-label"><g:link controller="type" action="show"
                                                                                      id="${decisionInstance?.type?.id}">${decisionInstance?.type?.encodeAsHTML()}</g:link></span>

                </li>
            </g:if>

            <g:if test="${decisionInstance?.units}">
                <li class="fieldcontain">
                    <span id="units-label" class="property-label"><g:message code="decision.units.label" default="Units"/></span>

                    <g:each in="${decisionInstance.units}" var="u">
                        <span class="property-value" aria-labelledby="units-label"><g:link controller="unit" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
                    </g:each>

                </li>
            </g:if>

            <g:if test="${decisionInstance?.versionId}">
                <li class="fieldcontain">
                    <span id="versionId-label" class="property-label"><g:message code="decision.versionId.label" default="Version Id"/></span>

                    <span class="property-value" aria-labelledby="versionId-label"><g:fieldValue bean="${decisionInstance}" field="versionId"/></span>

                </li>
            </g:if>

        </ol>--}%
</div>