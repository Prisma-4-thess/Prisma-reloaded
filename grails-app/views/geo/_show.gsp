%{--This should show the contents of one Geo--}%
%{--parameters: geoInstance--}%

<div id="show-geo" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/> <g:fieldValue bean="${geoInstance}" field="address"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list geo">

        <g:if test="${geoInstance?.latitude}">
            <li class="fieldcontain">
                <span id="latitude-label" class="property-label"><g:message code="geo.latitude.label" default="Latitude" /></span>

                <span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${geoInstance}" field="latitude"/></span>

            </li>
        </g:if>

        <g:if test="${geoInstance?.longitude}">
            <li class="fieldcontain">
                <span id="longitude-label" class="property-label"><g:message code="geo.longitude.label" default="Longitude" /></span>

                <span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${geoInstance}" field="longitude"/></span>

            </li>
        </g:if>

        <g:if test="${geoInstance?.address}">
            <li class="fieldcontain">
                <span id="address-label" class="property-label"><g:message code="geo.address.label" default="Address" /></span>

                <span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${geoInstance}" field="address"/></span>

            </li>
        </g:if>

        <g:if test="${geoInstance?.tk}">
            <li class="fieldcontain">
                <span id="tk-label" class="property-label"><g:message code="geo.tk.label" default="Tk" /></span>

                <span class="property-value" aria-labelledby="tk-label"><g:fieldValue bean="${geoInstance}" field="tk"/></span>

            </li>
        </g:if>

        <g:if test="${geoInstance?.newCat}">
            <li class="fieldcontain">
                <span id="newCat-label" class="property-label"><g:message code="geo.newCat.label" default="New Cat" /></span>

                <span class="property-value" aria-labelledby="newCat-label"><g:fieldValue bean="${geoInstance}" field="newCat"/></span>

            </li>
        </g:if>

        <g:if test="${geoInstance?.namegrk}">
            <li class="fieldcontain">
                <span id="namegrk-label" class="property-label"><g:message code="geo.namegrk.label" default="Namegrk" /></span>

                <span class="property-value" aria-labelledby="namegrk-label"><g:fieldValue bean="${geoInstance}" field="namegrk"/></span>

            </li>
        </g:if>

        <g:if test="${geoInstance?.phone}">
            <li class="fieldcontain">
                <span id="phone-label" class="property-label"><g:message code="geo.phone.label" default="Phone" /></span>

                <span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${geoInstance}" field="phone"/></span>

            </li>
        </g:if>

        <g:if test="${geoInstance?.dimos}">
            <li class="fieldcontain">
                <span id="dimos-label" class="property-label"><g:message code="geo.dimos.label" default="Dimos" /></span>

                <span class="property-value" aria-labelledby="dimos-label"><g:fieldValue bean="${geoInstance}" field="dimos"/></span>

            </li>
        </g:if>

        <g:if test="${geoInstance?.newSubCat}">
            <li class="fieldcontain">
                <span id="newSubCat-label" class="property-label"><g:message code="geo.newSubCat.label" default="New Sub Cat" /></span>

                <span class="property-value" aria-labelledby="newSubCat-label"><g:fieldValue bean="${geoInstance}" field="newSubCat"/></span>

            </li>
        </g:if>

        <g:if test="${geoInstance?.decisions}">
            <li class="fieldcontain">
                <span id="decisions-label" class="property-label"><g:message code="geo.decisions.label" default="Decisions" /></span>

                <g:each in="${geoInstance.decisions}" var="d">
                    <span class="property-value" aria-labelledby="decisions-label"><g:link controller="decision" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
</div>