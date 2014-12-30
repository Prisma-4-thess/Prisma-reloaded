%{--This shows a paginated table with Decision--}%
%{--parameters: decisionList, numOfResults (for the pagination)--}%

<div id="list-decision" class="content scaffold-list " role="main">
    %{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-hover">
        <thead>
        <tr class="info">
            <th><g:message code="decision.ada.label" default="Ada"/></th>

            <th><g:message code="decision.geo.label" default="Geo"/></th>

            <th><g:message code="decision.protocolNumber.label" default="Protocol Number"/></th>

            <th><g:message code="decision.subject.label" default="Subject"/></th>

            <th><g:message code="decision.signers.label" default="Signers"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${decisionList}" status="i" var="decisionInstance">
            <tr id="test${i}" class="${(i % 2) == 0 ? 'even' : 'odd'} mouseStyle" onclick="showDecision('#decision${i}')">

                <td>${fieldValue(bean: decisionInstance, field: "ada")}</td>

                <td>${fieldValue(bean: decisionInstance, field: "geo")}</td>

                <td>${fieldValue(bean: decisionInstance, field: "protocolNumber")}</td>

                <td>${fieldValue(bean: decisionInstance, field: "subject")}</td>

                <td>
                    <g:each in="${decisionInstance.signers}">
                        ${it}
                    </g:each>
                </td>

            </tr>
            <tr id="decision${i}" class="resultsDetails">
                <td colspan="5" >
                    <g:render template="/decision/show"
                              model="['decisionInstance': decisionInstance, 'entityName': 'Decision']"/>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${numOfResults ?: 0}" offset="${offset}"
                    params="['clicked': 'decision', 'searchBarQuery': searchBarQuery]"/>
    </div>
</div>

<script>
    function showDecision(decision){
            $(decision).fadeToggle(500);
    }

</script>