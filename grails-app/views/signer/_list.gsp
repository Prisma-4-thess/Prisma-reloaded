%{--This shows a paginated table with Signers--}%
%{--parameters: signerList, numOfResults (for the pagination)--}%

<div id="list-signer" class="content scaffold-list" role="main">
%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="uid" title="${message(code: 'signer.uid.label', default: 'Uid')}"
                              params="['clicked': 'signer', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="active" title="${message(code: 'signer.active.label', default: 'Active')}"
                              params="['clicked': 'signer', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="activeFrom"
                              title="${message(code: 'signer.activeFrom.label', default: 'Active From')}"
                              params="['clicked': 'signer', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="activeUntil"
                              title="${message(code: 'signer.activeUntil.label', default: 'Active Until')}"
                              params="['clicked': 'signer', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="firstName"
                              title="${message(code: 'signer.firstName.label', default: 'First Name')}"
                              params="['clicked': 'signer', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="lastName"
                              title="${message(code: 'signer.lastName.label', default: 'Last Name')}"
                              params="['clicked': 'signer', 'searchBarQuery': searchBarQuery]"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${signerList}" status="i" var="signerInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${signerInstance.id}">${fieldValue(bean: signerInstance, field: "uid")}</g:link></td>

                <td><g:formatBoolean boolean="${signerInstance.active}"/></td>

                <td>${fieldValue(bean: signerInstance, field: "activeFrom")}</td>

                <td>${fieldValue(bean: signerInstance, field: "activeUntil")}</td>

                <td>${fieldValue(bean: signerInstance, field: "firstName")}</td>

                <td>${fieldValue(bean: signerInstance, field: "lastName")}</td>

            </tr>
            <tr>
                <td colspan="6">

                    <g:render template="/signer/show"
                              model="['signerInstance': signerInstance, 'entityName': 'Signer']"/>

                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${numOfResults ?: 0}"
                    params="['clicked': 'signer', 'searchBarQuery': searchBarQuery]"/>
    </div>
</div>