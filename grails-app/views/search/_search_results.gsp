%{--With this template all the search results are shown--}%
%{--parameters: decisionList, signerList, organizationList, geoList, unitList--}%
%{--This should use the _list templates of the above domains--}%

<h1>Decisions</h1>
<g:if test="${decisionList}">
    <g:render template="/decision/list" model="['decisionList': decisionList, 'numOfResults': numOfResultsDec]"/>
</g:if>
<g:else>
    <g:render template="search_no_results"/>
</g:else>
<h1>Signers</h1>
<g:if test="${signerList}">
    <g:render template="/signer/list" model="['signerList': signerList, 'numOfResults': numOfResultsSigner]"/>
</g:if>
<g:else>
    <g:render template="search_no_results"/>
</g:else>
<h1>Types</h1>
<g:if test="${typeList}">
    <g:render template="/type/list" model="['typeList': typeList, 'numOfResults': numOfResultsType]"/>
</g:if>
<g:else>
    <g:render template="search_no_results"/>
</g:else>
<h1>Geos</h1>
<g:if test="${geoList}">
    <g:render template="/geo/list" model="['geoList': geoList, 'numOfResults': numOfResultsGeo]"/>
</g:if>
<g:else>
    <g:render template="search_no_results"/>
</g:else>