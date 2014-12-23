package com.meerkat

import javax.validation.constraints.Null

class SearchController {

    def showSearchResults(List<Decision> decisionList, List<Signer> signerList, List<Type> typeList, List<Geo> geoList, int numOfResultsDec, int numOfResultsSigner, int numOfResultsType, int numOfResultsGeo) {

        render(template: 'search_results', model: ['decisionList': decisionList, 'signerList': signerList, 'typeList': typeList, 'geoList': geoList, 'numOfResultsGeo': numOfResultsGeo, 'numOfResultsDec': numOfResultsDec, 'numOfResultsType': numOfResultsType, 'numOfResultsSigner': numOfResultsSigner])
    }

    def searchFromBar() {

        if (params.max == null) {
            params.max = getGrailsApplication().getConfig().pagination.defaultMax
        }
        if (params.offset == null) {
            params.offset = getGrailsApplication().getConfig().pagination.defaultOffset
        }

        String searchQuery = params.searchBarQuery;
        if (searchQuery == null) searchQuery = " " //TODO: Should be removed
        def decisionList
        def signerList
        def typeList
        def geoList
        int numOfResultsDec = 0, numOfResultsSigner = 0, numOfResultsType = 0, numOfResultsGeo = 0

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
//            geoList = SearchService.searchForPOI(searchQuery,params.max,params.offset,params.sort,params.order)
        } else {
            //TODO: Call service for search
            if (decisionList == null) {
                decisionList = Decision.list(params)
//                numOfResultsDec = Decision.getAll().size()
                numOfResultsDec = decisionList.totalCount
            }
            if (signerList == null) {
                signerList = Signer.list(params)
//                numOfResultsSigner = Signer.getAll().size()
                numOfResultsSigner = signerList.totalCount
            }
            if (typeList == null) {
                typeList = Type.list(params)
//                numOfResultsType = Type.getAll().size()
                numOfResultsType = typeList.totalCount
            }
            if (geoList == null) {
                geoList = Geo.list(params)
                //numOfResultsGeo = Geo.getAll().size()
//                geoList = SearchService.searchForPOI(searchQuery, params.max.toInteger(), params.offset.toInteger(), params.sort, params.order)
                numOfResultsGeo = geoList.totalCount
            }
        }

        print(params)

        //showSearchResults(decisionList, signerList, typeList, geoList)
        return ['searchBarQuery': params.searchBarQuery, 'decisionList': decisionList, 'signerList': signerList, 'typeList': typeList, 'geoList': geoList, 'numOfResultsGeo': numOfResultsGeo, 'numOfResultsDec': numOfResultsDec, 'numOfResultsType': numOfResultsType, 'numOfResultsSigner': numOfResultsSigner]

    }

    def index() {
        def poi=SearchService.searchForDecisions("στο λευκό τον πυργο πήρα τα φιλιά της",10,10,"","")
        println poi
    }
}
