%{--This shows a paginated table with Organization--}%
%{--parameters: organizationList, numOfResults (for the pagination)--}%

<div id="list-organization" class="content scaffold-list" role="main">
%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="label" title="${message(code: 'organization.label.label', default: 'Label')}"
                              params="['clicked': 'org', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="uid" title="${message(code: 'organization.uid.label', default: 'Uid')}"
                              params="['clicked': 'org', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="odeManagerEmail"
                              title="${message(code: 'organization.odeManagerEmail.label', default: 'Ode Manager Email')}"
                              params="['clicked': 'org', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="status" title="${message(code: 'organization.status.label', default: 'Status')}"
                              params="['clicked': 'org', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="vatNumber"
                              title="${message(code: 'organization.vatNumber.label', default: 'Vat Number')}"
                              params="['clicked': 'org', 'searchBarQuery': searchBarQuery]"/>

            <g:sortableColumn property="website"
                              title="${message(code: 'organization.website.label', default: 'Website')}"
                              params="['clicked': 'org', 'searchBarQuery': searchBarQuery]"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${orgList}" status="i" var="organizationInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${organizationInstance.id}">${fieldValue(bean: organizationInstance, field: "label")}</g:link></td>

                <td>${fieldValue(bean: organizationInstance, field: "uid")}</td>

                <td>${fieldValue(bean: organizationInstance, field: "odeManagerEmail")}</td>

                <td>${fieldValue(bean: organizationInstance, field: "status")}</td>

                <td>${fieldValue(bean: organizationInstance, field: "vatNumber")}</td>

                <td>${fieldValue(bean: organizationInstance, field: "website")}</td>

            </tr>
            <tr>
                <td colspan="6">

                    <g:render template="/organization/show"
                              model="['organizationInstance': organizationInstance, 'entityName': 'Organization']"/>

                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${numOfResults ?: 0}"
                    params="['clicked': 'org', 'searchBarQuery': searchBarQuery]"/>
    </div>
</div>