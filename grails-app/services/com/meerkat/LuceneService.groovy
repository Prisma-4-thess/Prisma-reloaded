package com.meerkat

import grails.transaction.Transactional

@Transactional
class LuceneService {

    static def decision2geo(Geo geo) {

        def decisions=SearchService.searchForDecisions(geo.namegrk,100,0,null,null)
        decisions.each{d->
            if(!geo.decisions.contains(d)){
                geo.addToDecisions(d)
            }
        }
    }
}
