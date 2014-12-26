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

        String searchQuery = params.searchBarQuery;
        def decisionList
        def signerList
        def typeList
        def geoList
        int numOfResultsDec = 0, numOfResultsSigner = 0, numOfResultsType = 0, numOfResultsGeo = 0
        if (searchQuery == null || searchQuery.isEmpty() || searchQuery.equals(" ")) return

        //TODO: Call service for sort/paginate
        if (params.clicked == "decision") {
            decisionList = Decision.list(params)
            numOfResultsDec = decisionList.totalCount
        } else if (params.clicked == "signer") {
            signerList = Signer.list(params)
            numOfResultsSigner = signerList.totalCount
        } else if (params.clicked == "type") {
            typeList = Type.list(params)
            numOfResultsType = typeList.totalCount
        } else if (params.clicked == "geo") {
            geoList = Geo.list(params)
//            geoList = SearchService.searchForPOI(searchQuery, params.max.toInteger(), params.offset.toInteger(), params.sort, params.order)
            numOfResultsGeo = geoList.totalCount
        } else {
            //TODO: Call service for search

                decisionList = Decision.list(params)
//                numOfResultsDec = Decision.getAll().size()
                numOfResultsDec = decisionList.totalCount
                 signerList = Signer.list(params)
//                numOfResultsSigner = Signer.getAll().size()
                numOfResultsSigner = signerList.totalCount
                typeList = Type.list(params)
//                numOfResultsType = Type.getAll().size()
                numOfResultsType = typeList.totalCount
                geoList = Geo.list(params)
                //numOfResultsGeo = Geo.getAll().size()
//                geoList = SearchService.searchForPOI(searchQuery, params.max.toInteger(), params.offset.toInteger(), params.sort, params.order)
                numOfResultsGeo = geoList.totalCount

        }

        print(params)

        //showSearchResults(decisionList, signerList, typeList, geoList)
        return ['searchBarQuery': params.searchBarQuery, 'decisionList': decisionList, 'signerList': signerList, 'typeList': typeList, 'geoList': geoList, 'numOfResultsGeo': numOfResultsGeo, 'numOfResultsDec': numOfResultsDec, 'numOfResultsType': numOfResultsType, 'numOfResultsSigner': numOfResultsSigner]

    }

    def index() {
        def decisions=Decision.list(max: 10,offset: 0)

    }
}
