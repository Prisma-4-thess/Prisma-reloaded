%{--Simple Search bar to search everywhere--}%

<g:form name="search_bar" controller="search" action="searchFromBar">
    <div class="form-group customSearchBar" id="mainSearch">
        <g:textField class="form-control customTextField" name="searchBarQuery" value="${searchBarQuery}"
                     placeholder="Search decisions, signatories, locations, etc..."/>

        <g:actionSubmitImage class="form-control-feedback customActionSubmitImage" value="search"
                             action="searchFromBar" name="searchBarSubmit"
                             src="${resource(dir: 'images', file: 'icons/png/magnify.png')}"/>

    </div>
</g:form>
