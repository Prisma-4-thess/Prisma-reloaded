%{--This template shows the nearby points of interest of a geo.--}%
%{--parameters: geoList--}%

<div class="list-group">
    <g:each in="${geoList}" var="geoInstance">

        <g:if test="${geoInstance?.namegrk}">

            <a class="list-group-item list-group-item-info" id="${geoInstance?.id}"
            onClick="updateFields('${geoInstance.namegrk}', ${geoInstance.latitude}, ${geoInstance.longitude}, '${geoInstance.address}')">
                %{--<g:message code="geo.namegrk.label" default="Namegrk"/>--}%

                <g:fieldValue bean="${geoInstance}" field="namegrk"/>
              </a>

        </g:if>

    </g:each>

</div>
