%{--Simple Search bar to search everywhere--}%

<g:form name="search_bar" controller="search" action="searchFromBar">
    <div class="form-group" id="mainSearch">
        <g:textField class="form-control" name="searchBarQuery" value="${searchBarQuery}" placeholder="Search decisions, signatories, locations, etc..."/>
        <div class="customSearchBar">
                <g:actionSubmitImage value="search" action="searchFromBar" name="searchBarSubmit" src="${resource(dir: 'images', file: 'icons/png/magnify.png')}"/>
        </div>
    </div>
</g:form>
