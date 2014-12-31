%{--With this template all the search results are shown--}%
%{--parameters: decisionList, signerList, organizationList, geoList, unitList--}%
%{--This should use the _list templates of the above domains--}%

<div class="row"><div class="col-md-12"><p></p></div></div>
 <div class="panel panel-info">
    <div class="panel-heading"><h3>Decisions</h3></div>

    <div class="panel-body">
        <p>Government decisions containing the search terms.</p>
    </div>
    <g:if test="${decisionList}">
        <g:render template="/decision/list" model="['decisionList': decisionList, 'numOfResults': numOfResultsDec, 'offset':decisionOffset]"/>
    </g:if>
    <g:else>
        <g:render template="search_no_results"/>
    </g:else>
</div>


<div class="panel panel-info" >
    <div class="panel-heading"><h3>Signers</h3></div>
    <div class="panel-body">
        <p>List of signers whose names include the search terms.</p>
    </div>
<g:if test="${signerList}">
    <g:render template="/signer/list" model="['signerList': signerList, 'numOfResults': numOfResultsSigner, 'offset':signerOffset]"/>
</g:if>
<g:else>
    <g:render template="search_no_results"/>
</g:else>
</div>

<div class="panel panel-info" >
    <div class="panel-heading"><h3>Types</h3></div>
    <div class="panel-body">
        <p>Types containing the search terms.</p>
    </div>
<g:if test="${typeList}">
    <g:render template="/type/list" model="['typeList': typeList, 'numOfResults': numOfResultsType, 'offset':typeOffset]"/>
</g:if>
<g:else>
    <g:render template="search_no_results"/>
</g:else>
</div>


<div class="panel panel-info" >
    <div class="panel-heading"><h3>Locations</h3></div>
    <div class="panel-body">
        <p>Locations containing the search terms.</p>
    </div>
<g:if test="${geoList}">
    <g:render template="/geo/list" model="['geoList': geoList, 'numOfResults': numOfResultsGeo, 'offset':geoOffset]"/>
</g:if>
<g:else>
    <g:render template="search_no_results"/>
</g:else>
</div>