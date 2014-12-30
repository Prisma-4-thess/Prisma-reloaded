%{--This shows a paginated table with Signers--}%
%{--parameters: signerList, numOfResults (for the pagination)--}%

<div id="list-signer" class="content scaffold-list" role="main">
%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-hover">
        <thead>
        <tr class="info">
            <th><g:message code="signer.firstName.label" default="First Name"/></th>
            <th><g:message code="signer.lastName.label" default="Last Name"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${signerList}" status="i" var="signerInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'} mouseStyle" id="testSigner${i}" onclick="showSigner('#signer${i}')">

                <td>${fieldValue(bean: signerInstance, field: "firstName")}</td>

                <td>${fieldValue(bean: signerInstance, field: "lastName")}</td>

            </tr>
            <tr class="resultsDetails" id="signer${i}">
                <td colspan="2">
                    <g:render template="/signer/show"
                              model="['signerInstance': signerInstance, 'entityName': 'Signer']"/>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${numOfResults ?: 0}" offset="${offset}"
                    params="['clicked': 'signer', 'searchBarQuery': searchBarQuery]"/>
    </div>
</div>
<script>
    function showSigner(signer){
        $(signer).fadeToggle(500);
    }
</script>