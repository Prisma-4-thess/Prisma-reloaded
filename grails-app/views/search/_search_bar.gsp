%{--Simple Search bar to search everywhere--}%

<g:form name="search_bar" controller="search" action="searchFromBar">
    <div class="form-group" id="mainSearch">
        <g:textField  type="email" class="form-control" name="searchBarQuery" value="${searchBarQuery}" placeholder="Search decisions, signatories, locations, etc..."/>
        <div class="customSearchBar"><g:img dir="images" name="searchBarSubmit" type="submit" file="icons/png/magnify.png" /></div>
    </div>
</g:form>
