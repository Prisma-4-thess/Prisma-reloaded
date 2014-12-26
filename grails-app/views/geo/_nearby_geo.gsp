%{--This template shows the nearby points of interest of a geo.--}%
%{--parameters: geoList--}%

<ul>
    <li>${numOfResults}</li>
    <g:each in="${geoList}" var="geoInstance">

        <g:if test="${geoInstance?.namegrk}">
            <li>
                <g:message code="geo.namegrk.label" default="Namegrk"/>

                <g:fieldValue bean="${geoInstance}" field="namegrk"/>

            </li>
        </g:if>

    </g:each>

</ul>
