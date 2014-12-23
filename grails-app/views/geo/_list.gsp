%{--This shows a paginated table with Geos--}%
%{--parameters: geoList, numOfResults (for the pagination)--}%

<div id="list-geo" class="content scaffold-list" role="main">
%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="latitude" title="${message(code: 'geo.latitude.label', default: 'Latitude')}" params="['clicked': 'geo','searchBarQuery':searchBarQuery]"/>

            <g:sortableColumn property="longitude"
                              title="${message(code: 'geo.longitude.label', default: 'Longitude')}" params="['clicked': 'geo','searchBarQuery':searchBarQuery]"/>

            <g:sortableColumn property="address" title="${message(code: 'geo.address.label', default: 'Address')}" params="['clicked': 'geo','searchBarQuery':searchBarQuery]"/>

            <g:sortableColumn property="tk" title="${message(code: 'geo.tk.label', default: 'Tk')}" params="['clicked': 'geo','searchBarQuery':searchBarQuery]"/>

            <g:sortableColumn property="newCat" title="${message(code: 'geo.newCat.label', default: 'New Cat')}" params="['clicked': 'geo','searchBarQuery':searchBarQuery]"/>

            <g:sortableColumn property="namegrk" title="${message(code: 'geo.namegrk.label', default: 'Namegrk')}" params="['clicked': 'geo','searchBarQuery':searchBarQuery]"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${geoList}" status="i" var="geoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link controller="geo" action="showGeo"
                            id="${geoInstance.id}">${fieldValue(bean: geoInstance, field: "latitude")}</g:link></td>

                <td>${fieldValue(bean: geoInstance, field: "longitude")}</td>

                <td>${fieldValue(bean: geoInstance, field: "address")}</td>

                <td>${fieldValue(bean: geoInstance, field: "tk")}</td>

                <td>${fieldValue(bean: geoInstance, field: "newCat")}</td>

                <td>${fieldValue(bean: geoInstance, field: "namegrk")}</td>

            </tr>
            <tr>
                <td colspan="6">

                    <g:render template="/geo/show" model="['geoInstance': geoInstance, 'entityName': 'Geo']"/>

                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${numOfResults ?: 0}" params="['clicked': 'geo','searchBarQuery':searchBarQuery]"/>
    </div>
</div>