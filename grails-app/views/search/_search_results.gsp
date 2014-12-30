%{--With this template all the search results are shown--}%
%{--parameters: decisionList, signerList, organizationList, geoList, unitList--}%
%{--This should use the _list templates of the above domains--}%

<div class="row"><div class="col-md-12"><p></p></div></div>
 <div class="panel panel-info">
    <div class="panel-heading">Decisions</div>

    <div class="panel-body">
        <p>Here we can add some info about the heading</p>
    </div>
    <g:if test="${decisionList}">
        <g:render template="/decision/list" model="['decisionList': decisionList, 'numOfResults': numOfResultsDec, 'offset':decisionOffset]"/>
    </g:if>
    <g:else>
        <g:render template="search_no_results"/>
    </g:else>
</div>


<div class="panel panel-info" >
    <div class="panel-heading">Signers</div>
    <div class="panel-body">
        <p>Here we can add some info about the heading</p>
    </div>
<g:if test="${signerList}">
    <g:render template="/signer/list" model="['signerList': signerList, 'numOfResults': numOfResultsSigner, 'offset':signerOffset]"/>
</g:if>
<g:else>
    <g:render template="search_no_results"/>
</g:else>
</div>

<div class="panel panel-info" >
    <div class="panel-heading">Types</div>
    <div class="panel-body">
        <p>Here we can add some info about the heading</p>
    </div>
<g:if test="${typeList}">
    <g:render template="/type/list" model="['typeList': typeList, 'numOfResults': numOfResultsType, 'offset':typeOffset]"/>
</g:if>
<g:else>
    <g:render template="search_no_results"/>
</g:else>
</div>


<div class="panel panel-info" >
    <div class="panel-heading">Geos</div>
    <div class="panel-body">
        <p>Here we can add some info about the heading</p>
    </div>
<g:if test="${geoList}">
    <g:render template="/geo/list" model="['geoList': geoList, 'numOfResults': numOfResultsGeo, 'offset':geoOffset]"/>
</g:if>
<g:else>
    <g:render template="search_no_results"/>
</g:else>
</div>