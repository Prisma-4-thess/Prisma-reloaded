%{--Simple Search bar to search everywhere--}%

<g:form name="search_bar" controller="search" action="searchFromBar">
    <g:textField name="searchBarQuery" value="${searchBarQuery}"/>

    <g:submitButton name="searchBarSubmit" type="submit" value="Yo"/>

</g:form>
