package com.meerkat


class SearchController {

    /**
     * Function to load template for showing table with search results
     * @param decisionList
     * @param signerList
     * @param typeList
     * @param geoList
     * @param numOfResultsDec
     * @param numOfResultsSigner
     * @param numOfResultsType
     * @param numOfResultsGeo
     * @return
     */
    def showSearchResults(List<Decision> decisionList, List<Signer> signerList, List<Type> typeList, List<Geo> geoList, int numOfResultsDec, int numOfResultsSigner, int numOfResultsType, int numOfResultsGeo) {

        render(template: 'search_results', model: ['decisionList': decisionList, 'signerList': signerList, 'typeList': typeList, 'geoList': geoList, 'numOfResultsGeo': numOfResultsGeo, 'numOfResultsDec': numOfResultsDec, 'numOfResultsType': numOfResultsType, 'numOfResultsSigner': numOfResultsSigner])
    }

    /**
     * Loads page after searching from searchbar, showing the results
     * @return
     */
    def searchFromBar() {

        if (params.max == null) {
            params.max = getGrailsApplication().getConfig().pagination.defaultMax
        }
        if (params.offset == null) {
            params.offset = getGrailsApplication().getConfig().pagination.defaultOffset
        }
        if (params.sort == null) {
            params.sort = "ada"
        }
        if (params.order == null) {
            params.order = "asc"
        }

        String searchQuery = params.searchBarQuery;
        def decisionList
        def signerList
        def typeList
        def geoList
        int numOfResultsDec = 0, numOfResultsSigner = 0, numOfResultsType = 0, numOfResultsGeo = 0
        if (searchQuery == null || searchQuery.isEmpty() || searchQuery.equals(" ")) return

        print(params)

        //TODO: Call service for sort/paginate
        if (params.clicked == "decision") {
//            decisionList = Decision.list(params)
            decisionList = SearchService.searchForDecisions(searchQuery, params.max.toInteger(), params.offset.toInteger(), params.sort, params.order)
            numOfResultsDec = decisionList.totalNumOfRes
        } else if (params.clicked == "signer") {
//            signerList = Signer.list(params)
            signerList = SearchService.searchForSigners(searchQuery, params.max.toInteger(), params.offset.toInteger(), params.sort, params.order)
            numOfResultsSigner = signerList.totalNumOfRes
        } else if (params.clicked == "type") {
//            typeList = Type.list(params)
            typeList = SearchService.searchForTypes(searchQuery, params.max.toInteger(), params.offset.toInteger(), params.sort, params.order)
            numOfResultsType = typeList.totalNumOfRes
        } else if (params.clicked == "geo") {
//            geoList = Geo.list(params)
            geoList = SearchService.searchForPOI(searchQuery, params.max.toInteger(), params.offset.toInteger(), params.sort, params.order)
            numOfResultsGeo = geoList.totalNumOfRes
        } else {
            //TODO: Call service for search

//                decisionList = Decision.list(params)
            decisionList = SearchService.searchForDecisions(searchQuery, 10, 0, "ada", "asc")
//                numOfResultsDec = Decision.getAll().size()
            numOfResultsDec = decisionList.totalNumOfRes
            println numOfResultsDec
//                 signerList = Signer.list(params)
            signerList = SearchService.searchForSigners(searchQuery, 10, 0, "ada", "asc")
//                numOfResultsSigner = Signer.getAll().size()
            numOfResultsSigner = signerList.totalNumOfRes
            println signerList
//                typeList = Type.list(params)
            typeList = SearchService.searchForTypes(searchQuery, 10, 0, "ada", "asc")
//                numOfResultsType = Type.getAll().size()
            numOfResultsType = typeList.totalNumOfRes
            println numOfResultsType
//                geoList = Geo.list(params)
            //numOfResultsGeo = Geo.getAll().size()
            geoList = SearchService.searchForPOI(searchQuery, 10, 0, "ada", "asc")
            numOfResultsGeo = geoList.totalNumOfRes
            println numOfResultsGeo
        }

        //showSearchResults(decisionList, signerList, typeList, geoList)
        return ['searchBarQuery': params.searchBarQuery, 'decisionList': decisionList.list, 'signerList': signerList.list, 'typeList': typeList.list, 'geoList': geoList.list, 'numOfResultsGeo': numOfResultsGeo, 'numOfResultsDec': numOfResultsDec, 'numOfResultsType': numOfResultsType, 'numOfResultsSigner': numOfResultsSigner]

    }

    def index() {
        println GeoService.getGeosWithDecisions()

    }
}
