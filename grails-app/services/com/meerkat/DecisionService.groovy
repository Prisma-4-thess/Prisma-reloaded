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

    /*
    Return the only the correct decision based on the given ada
    parametrs: String ada
    return: Decision decisions
     */
    def getCorrectDecisionByAda(String ada){
        def decisions=Decision.findAllByAda(ada)
        def returnDecision
        decisions.each {d->
            if(!d.correctedDecision){
                returnDecision=d
            }
        }
        return returnDecision
    }
    /*
    Find decisions with exact or like Protocol Number as given
    parametrs: String number,the 4 params for pagination
    return:List decisions
     */
    def findDecisionByProtNum(String number,int max,int offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list() {
            like("protocolNumber",number)
            order(sort,orderList)
            firstResult(offset)
            maxResults(max)
        }
        return decisions
    }
}
