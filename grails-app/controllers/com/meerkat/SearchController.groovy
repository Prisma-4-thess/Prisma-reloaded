package com.meerkat

class SearchController {

    def showSearchResults(List<Decision> decisionList, List<Signer> signerList, List<Type> typeList, List<Geo> geoList) {

        if (params.clicked == null) {
            if (decisionList == null) decisionList = Decision.list(params)
            if (signerList == null) signerList = Signer.list(params)
            if (typeList == null) typeList = Type.list(params)
            if (geoList == null) geoList = Geo.list(params)
        }
        if (params.clicked == "decision") {
            geoList = Geo.list(params)
        } else if (params.clicked == "signer") {
            geoList = Geo.list(params)
        } else if (params.clicked == "type") {
            geoList = Geo.list(params)
        } else if (params.clicked == "geo") {
            geoList = Geo.list(params)
        }

        render(template: 'search_results', model: ['decisionList': decisionList, 'signerList': signerList, 'typeList': typeList, 'geoList': geoList])
    }

    def searchFromBar() {

        print(params)
        //TODO: Call service for search
        showSearchResults(null, null, null, null)

    }

    def index() {}
}
