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
            %{--
            <g:sortableColumn property="issueDate"
                              title="${message(code: 'decision.issueDate.label', default: 'Issue Date')}"
                              params="['clicked': 'decision', 'searchBarQuery': searchBarQuery]"/>
--}%
            <g:sortableColumn property="ada" title="${message(code: 'decision.ada.label', default: 'Ada')}"
                              params="['clicked': 'decision', 'searchBarQuery': searchBarQuery]"/>

    %{--        <g:sortableColumn property="correctedVersionId"
                              title="${message(code: 'decision.correctedVersionId.label', default: 'Corrected Version Id')}"
                              params="['clicked': 'decision', 'searchBarQuery': searchBarQuery]"/>
--}%
            <th><g:message code="decision.geo.label" default="Geo"/></th>

            <g:sortableColumn property="protocolNumber"
                              title="${message(code: 'decision.protocolNumber.label', default: 'Protocol Number')}"
                              params="['clicked': 'decision', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="subject" title="${message(code: 'decision.subject.label', default: 'Subject')}"
                              params="['clicked': 'decision', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="signers" title="${message(code: 'decision.signers.label', default: 'Signers')}"
                               params="['clicked':'decision','searchBarQuery': searchBarQuery]" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${decisionList}" status="i" var="decisionInstance">
            <tr id="test${i}" class="${(i % 2) == 0 ? 'even' : 'odd'} mouseStyle" onclick="showDecision('#decision${i}')">
%{--

                <td ><g:link action="show"
                            id="${decisionInstance.id}">${fieldValue(bean: decisionInstance, field: "issueDate")}</g:link></td>
--}%

                <td>${fieldValue(bean: decisionInstance, field: "ada")}</td>

%{--                <td>${fieldValue(bean: decisionInstance, field: "correctedVersionId")}</td>--}%

                <td>${fieldValue(bean: decisionInstance, field: "geo")}</td>

                <td>${fieldValue(bean: decisionInstance, field: "protocolNumber")}</td>

                <td>${fieldValue(bean: decisionInstance, field: "subject")}</td>

                <td>${fieldValue(bean: decisionInstance, field: "signers")}</td>

            </tr>
            <tr id="decision${i}" class="decisionDetails">
                <td colspan="5" style="padding: 0">
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
    $(document).ready(function(){
        $(".decisionDetails").hide();
    });
    function showDecision(decision){
            $(decision).fadeToggle(500);
    }

</script>