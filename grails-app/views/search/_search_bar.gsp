%{--Simple Search bar to search everywhere--}%

<g:form name="search_bar" controller="search" action="searchFromBar">
    <div class="form-group" id="mainSearch">
    <g:textField class="form-control" name="searchBarQuery" value="${searchBarQuery}" placeholder="Search decisions, signatories, locations, etc..."/>
    </div>
    <div class="form-actions" id="submitBtn">
         <g:submitButton class="btn btn-default searchBtn" name="searchBarSubmit" type="submit" value="Yo"/>
    </div>
</g:form>
