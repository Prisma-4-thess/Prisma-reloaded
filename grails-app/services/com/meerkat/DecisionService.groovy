package com.meerkat

import grails.transaction.Transactional

@Transactional
class DecisionService {
    /*
    Return the decision identified by ada with all the version history
    parametrs: String ada
    return: List decisions
     */
    def getDecisionByAda(String ada){
        def decisions=Decision.findAllByAda(ada)
        return decisions
    }
}
