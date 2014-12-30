%{--This shows a paginated table with Types--}%
%{--parameters: typeList, numOfResults (for the pagination)--}%

<div id="list-type" class="content scaffold-list" role="main">
%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-hover">
        <thead>
        <tr  class="info">

            <g:sortableColumn property="label" title="${message(code: 'type.label.label', default: 'Label')}"
                              params="['clicked': 'type', 'searchBarQuery': searchBarQuery]"/>

            <th><g:message code="type.decisions.number" default="Number of decisions"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${typeList}" status="i" var="typeInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'} ">

                <td>${fieldValue(bean: typeInstance, field: "label")}</td>

                <td class="mouseStyle"><g:link controller="decision" action="listDecisionOfType"
                            id="${typeInstance.id}">${com.meerkat.SearchService.numOfDecisionOfType(typeInstance.id)}</g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${numOfResults ?: 0}" offset="${offset}" params="['clicked': 'type', 'searchBarQuery': searchBarQuery]"/>
    </div>
</div>