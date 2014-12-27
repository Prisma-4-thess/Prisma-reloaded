%{--This shows a paginated table with Types--}%
%{--parameters: typeList, numOfResults (for the pagination)--}%

<div id="list-type" class="content scaffold-list" role="main">
%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="label" title="${message(code: 'type.label.label', default: 'Label')}"
                              params="['clicked': 'type', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="uid" title="${message(code: 'type.uid.label', default: 'Uid')}"
                              params="['clicked': 'type', 'searchBarQuery': searchBarQuery]"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${typeInstanceList}" status="i" var="typeInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${typeInstance.id}">${fieldValue(bean: typeInstance, field: "label")}</g:link></td>

                <td>${fieldValue(bean: typeInstance, field: "uid")}</td>

            </tr>
            <tr>
                <td colspan="6">

                    <g:render template="/type/show" model="['typeInstance': typeInstance, 'entityName': 'Type']"/>

                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${typeInstanceCount ?: 0}" params="['clicked': 'type', 'searchBarQuery': searchBarQuery]"/>
    </div>
</div>