%{--This shows a paginated table with Units--}%
%{--parameters: unitList, numOfResults (for the pagination)--}%

<div id="list-unit" class="content scaffold-list" role="main">
%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="uid" title="${message(code: 'unit.uid.label', default: 'Uid')}"
                              params="['clicked': 'unit', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="active" title="${message(code: 'unit.active.label', default: 'Active')}"
                              params="['clicked': 'unit', 'searchBarQuery': searchBarQuery]"/>

            <th><g:message code="unit.geo.label" default="Geo"/></th>

            <g:sortableColumn property="label" title="${message(code: 'unit.label.label', default: 'Label')}"
                              params="['clicked': 'unit', 'searchBarQuery': searchBarQuery]"/>

            <th><g:message code="unit.parent.label" default="Parent"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${unitList}" status="i" var="unitInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${unitInstance.id}">${fieldValue(bean: unitInstance, field: "uid")}</g:link></td>

                <td><g:formatBoolean boolean="${unitInstance.active}"/></td>

                <td>${fieldValue(bean: unitInstance, field: "geo")}</td>

                <td>${fieldValue(bean: unitInstance, field: "label")}</td>

                <td>${fieldValue(bean: unitInstance, field: "parent")}</td>

            </tr>
            <tr>
                <td colspan="6">

                    <g:render template="/unit/show" model="['unitInstance': unitInstance, 'entityName': 'Unit']"/>

                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${numOfResults ?: 0}" params="['clicked': 'unit', 'searchBarQuery': searchBarQuery]"/>
    </div>
</div>