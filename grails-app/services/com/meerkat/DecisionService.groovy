package com.meerkat

import grails.transaction.Transactional

@Transactional
class DecisionService {
    /**
    Return the decision identified by ada with all the version history
    parameters: String ada
    return: List decisions
     */
    static def getDecisionByAda(String ada){
        def decisions=Decision.findAllByAda(ada)
        return decisions
    }

    /**
    Return the only the correct decision based on the given ada
    parameters: String ada
    return: Decision decisions
     */
    static def getCorrectDecisionByAda(String ada){
        def decisions=Decision.findAllByAda(ada)
        def returnDecision
        decisions.each {d->
            if(!d.correctedDecision){
                returnDecision=d
            }
        }
        return returnDecision
    }

    /**
    Find decisions with exact or like Protocol Number as given
    parameters: String number,the 4 params for pagination
    return:List decisions
     */
    static def findDecisionByProtNum(String number,int max,int offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list() {
            like("protocolNumber",number)
            order(sort,orderList)
            firstResult(offset)
            maxResults(max)
        }
        return decisions
    }

    /**
    Find decisions with subject like the param given
    parameters: String subject,the 4 params for pagination
    return:List decisions
     */
    static def findDecisionBySubject(String subject,int max,int offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list() {
            like("subject","%"+subject+"%")
            order(sort,orderList)
            firstResult(offset)
            maxResults(max)
        }
        return decisions
    }

    /**
    Find decisions with type exactly as the param given
    parameters: String type,the 4 params for pagination
    return:List decisions
     */
    static def findDecisionByType(String type,int max,int offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list() {
            eq("type",type)
            order(sort,orderList)
            firstResult(offset)
            maxResults(max)
        }
        return decisions
    }

    /**
    Find decisions with geo exactly as the param given
    parameters: Geo geo,the 4 params for pagination
    return:List decisions
     */
    static def findDecisionByPOI(Geo geo,int max,int offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list {
            eq("geo",geo)
            order(sort,orderList)
            firstResult(offset)
            maxResults(max)
        }
        return decisions
    }

    /**
    Find decisions signed by signer like or exactly as the param given
    parameters: String signer,the 4 params for pagination
    return:List decisions
     */
    static def findDecisionBySigner(String signer,int max,int offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list() {
            like("signer",signer)
            order(sort,orderList)
            firstResult(offset)
            maxResults(max)
        }
        return decisions
    }

    /**
    Find decisions taken by unit like or exactly as the param given
    parameters: String subject,the 4 params for pagination
    return:List decisions
     */
    static def findDecisionByUnit(String unit,int max,int offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list() {
            like("subject",unit)
            order(sort,orderList)
            firstResult(offset)
            maxResults(max)
        }
        return decisions
    }

    /**
    Returns the thematic category of a decision
    parameters: Decision decision
    return: List themCat
     */
    static def getThematicCategory(Decision decision){
        def themCat=DictionaryItem.createCriteria().list{
            and{
                eq("ada",decision.ada)
                eq("versionId",decision.versionId)
            }
        }
        return themCat
    }

    /**
    return a map containing label of extra field and value of the given as parameter decision
    parameters: Decision decision
    return: Map returnMap
     */
    static def getExtraFields(Decision decision){
        def returnMap=[:]
        def extras=DecisionExtraFieldValue.createCriteria().list {
            eq("ada",decision.ada)
            eq("versionId",decision.versionId)
        }
        extras.each {extra->
            extra.value.ownerExtraField.id
            returnMap.put(extra.value.ownerExtraField.id,extra.value.value)
        }
        return returnMap
    }


}
