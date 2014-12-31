<%@ page import="com.meerkat.Decision" %>
%{--This shows a paginated table with Geos--}%
%{--parameters: geoList, numOfResults (for the pagination)--}%

<div id="list-geo" class="content scaffold-list" role="main">
%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-hover">
        <thead>
        <tr class="info">
            <th><g:message code="geo.latitude.label" default="Latitude"/></th>

            <th><g:message code="geo.longitude.label" default="Longitude"/></th>

            <th><g:message code="geo.address.label" default="Address"/></th>

            %{--<th><g:message code="geo.dimos.label" default="Dimos"/></th>--}%
            <th><g:message code="geo.namegrk.label" default="Name"/></th>

            <th><g:message code="geo.decisions.number" default="Number of decisions"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${geoList}" status="i" var="geoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'} mouseStyle"  id="testGeo${i}" onclick="showGeo('#geo${i}')">

                <td>${fieldValue(bean: geoInstance, field: "latitude")}</td>

                <td>${fieldValue(bean: geoInstance, field: "longitude")}</td>

                <td>${fieldValue(bean: geoInstance, field: "address")}</td>

                %{--<td>${fieldValue(bean: geoInstance, field: "dimos")}</td>--}%

                <td>${fieldValue(bean: geoInstance, field: "namegrk")}</td>


                    <g:if test="${(numOfDecOfGeo = Decision.findAllByGeo(geoInstance).size())>0}">
                        <td class="mouseStyle">
                    <g:link controller="geo" action="showDecisionsOfGeo"
                                               id="${geoInstance.id}">${numOfDecOfGeo}</g:link></td>
                    </g:if>
                <g:else>
                    <td>
                        <g:message code="geo.decisions.zero" default="0"/>
                    </td>

                </g:else>

            </tr>
            <tr  id="geo${i}" class="resultsDetails">
                <td colspan="5">
                    <g:render template="/geo/show" model="['geoInstance': geoInstance, 'entityName': 'Geo']"/>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${numOfResults ?: 0}" offset="${offset}" params="['clicked': 'geo', 'searchBarQuery': searchBarQuery]"/>
    </div>
</div>
<script>
    function showGeo(geo){
        $(geo).fadeToggle(500);
    }
</script>