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
    def showSearchResults(List<Decision> decisionList, List<Signer> signerList, List<Type> typeList, List<Geo> geoList, int numOfResultsDec, int numOfResultsSigner, int numOfResultsType, int numOfResultsGeo, int decisionOffset, int typeOffset, int geoOffset, int signerOffset) {

        render(template: 'search_results', model: ['decisionList': decisionList, 'signerList': signerList, 'typeList': typeList, 'geoList': geoList,
                                                   'numOfResultsGeo': numOfResultsGeo, 'numOfResultsDec': numOfResultsDec, 'numOfResultsType': numOfResultsType, 'numOfResultsSigner': numOfResultsSigner,
                                                   'decisionOffset' : decisionOffset, 'signerOffset': signerOffset, 'typeOffset': typeOffset, 'geoOffset': geoOffset
                                                    ])
    }

    /**
     * Loads page after searching from searchbar, showing the results
     * @return
     */
    def searchFromBar() {

        String searchQuery = params.searchBarQuery;
        def decisionList
        def signerList
        def typeList
        def geoList
        int numOfResultsDec = 0, numOfResultsSigner = 0, numOfResultsType = 0, numOfResultsGeo = 0, decisionOffset = 0, typeOffset = 0, geoOffset = 0, signerOffset = 0
        if (searchQuery == null || searchQuery.isEmpty() || searchQuery.equals(" ")) return

        if (params.max == null) {
            params.max = getGrailsApplication().getConfig().pagination.defaultMax
        }
        if (params.offset == null) {

            decisionOffset = signerOffset = geoOffset = typeOffset = getGrailsApplication().getConfig().pagination.defaultOffset.toInteger()
        }
        if (params.sort == null) {
            params.sort = "ada"
        }
        if (params.order == null) {
            params.order = "asc"
        }

        print(params)

        //TODO: Call service for sort/paginate
        if (params.clicked == "decision") {
//            decisionList = Decision.list(params)
            decisionOffset = params.offset.toInteger()
            decisionList = SearchService.searchForDecisions(searchQuery, params.max.toInteger(), decisionOffset, params.sort, params.order)
            numOfResultsDec = decisionList.totalNumOfRes
            println decisionList.list
        } else if (params.clicked == "signer") {
//            signerList = Signer.list(params)
            signerOffset = params.offset.toInteger()
            signerList = SearchService.searchForSigners(searchQuery, params.max.toInteger(), signerOffset, params.sort, params.order)
            numOfResultsSigner = signerList.totalNumOfRes
        } else if (params.clicked == "type") {
//            typeList = Type.list(params)
            typeOffset = params.offset.toInteger()
            typeList = SearchService.searchForTypes(searchQuery, params.max.toInteger(), typeOffset, params.sort, params.order)
            numOfResultsType = typeList.totalNumOfRes
        } else if (params.clicked == "geo") {
//            geoList = Geo.list(params)
            geoOffset = params.offset.toInteger()
            geoList = SearchService.searchForPOI(searchQuery, params.max.toInteger(), geoOffset, params.sort, params.order)
            numOfResultsGeo = geoList.totalNumOfRes
        }
        //TODO: Call service for search
        if (decisionList == null) {
//                decisionList = Decision.list(params)
            decisionList = SearchService.searchForDecisions(searchQuery, params.max.toInteger(), decisionOffset, "ada", "asc")
//                numOfResultsDec = Decision.getAll().size()
            numOfResultsDec = decisionList.totalNumOfRes
            println numOfResultsDec
        }
        if (signerList == null) {
//                 signerList = Signer.list(params)
            signerList = SearchService.searchForSigners(searchQuery, params.max.toInteger(), signerOffset, "ada", "asc")
//                numOfResultsSigner = Signer.getAll().size()
            numOfResultsSigner = signerList.totalNumOfRes
            println signerList
        }
        if (typeList == null) {
//                typeList = Type.list(params)
            typeList = SearchService.searchForTypes(searchQuery, params.max.toInteger(), typeOffset, "ada", "asc")
//                numOfResultsType = Type.getAll().size()
            numOfResultsType = typeList.totalNumOfRes
            println numOfResultsType
        }
//                geoList = Geo.list(params)
        //numOfResultsGeo = Geo.getAll().size()
        if (geoList == null) {
            geoList = SearchService.searchForPOI(searchQuery, params.max.toInteger(), geoOffset, "ada", "asc")
            numOfResultsGeo = geoList.totalNumOfRes
            println numOfResultsGeo
        }

//        println decisionList.list
        //showSearchResults(decisionList, signerList, typeList, geoList)
        params.remove("offset")
        return ['searchBarQuery' : params.searchBarQuery,
                'decisionList'   : decisionList.list, 'signerList': signerList.list, 'typeList': typeList.list, 'geoList': geoList.list,
                'numOfResultsGeo': numOfResultsGeo, 'numOfResultsDec': numOfResultsDec, 'numOfResultsType': numOfResultsType, 'numOfResultsSigner': numOfResultsSigner,
                'decisionOffset' : decisionOffset, 'signerOffset': signerOffset, 'typeOffset': typeOffset, 'geoOffset': geoOffset
        ]

    }

    def index() {
        float score=1
        LuceneService.decision2geo(score)
    }
}
