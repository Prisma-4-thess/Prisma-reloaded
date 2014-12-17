package com.meerkat

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

        List<Decision> decisionList
        List<Signer> signerList
        List<Type> typeList
        List<Geo> geoList
        int numOfResultsDec = 0, numOfResultsSigner = 0, numOfResultsType = 0, numOfResultsGeo = 0

        //TODO: Call service for search
        if (params.clicked == null) {
            if (decisionList == null) {
                decisionList = Decision.list(params)
                numOfResultsDec = Decision.getAll().size()
            }
            if (signerList == null) {
                signerList = Signer.list(params)
                numOfResultsSigner = Signer.getAll().size()
            }
            if (typeList == null) {
                typeList = Type.list(params)
                numOfResultsType = Type.getAll().size()
            }
            if (geoList == null) {
                geoList = Geo.list(params)
                numOfResultsGeo = Geo.getAll().size()
            }
        }

        //TODO: Call service for sort/offset
        if (params.clicked == "decision") {
            decisionList = Decision.list(params)
        } else if (params.clicked == "signer") {
            signerList = Signer.list(params)
        } else if (params.clicked == "type") {
            typeList = Type.list(params)
        } else if (params.clicked == "geo") {
            geoList = Geo.list(params)
        }

        print(params)

        //showSearchResults(decisionList, signerList, typeList, geoList)
        return ['searchBarQuery': params.searchBarQuery, 'decisionList': decisionList, 'signerList': signerList, 'typeList': typeList, 'geoList': geoList, 'numOfResultsGeo': numOfResultsGeo, 'numOfResultsDec': numOfResultsDec, 'numOfResultsType': numOfResultsType, 'numOfResultsSigner': numOfResultsSigner]

    }

    def index() {}
}
