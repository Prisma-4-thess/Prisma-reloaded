package com.meerkat

import grails.transaction.Transactional
import org.apache.lucene.analysis.el.GreekStemmer
@Transactional
class DecisionService {
    def stemmer=new GreekStemmer()
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
    return:PagedResultList decisions
     */
    static def findDecisionByProtNum(String number,int par_max,int par_offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list(max: par_max, offset: par_offset) {
            like("protocolNumber",number)
            if (sort){
            order(sort,orderList)
            }
        }
        return decisions
    }

    /**
    Find decisions with subject like the param given
    parameters: String subject,the 4 params for pagination
    return:PagedResultList decisions
     */
    static def findDecisionBySubject(String subject,int par_max,int par_offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list(max: par_max, offset: par_offset) {
            like("subject","%"+subject+"%")
            if (sort){
                order(sort,orderList)
            }
        }
        return decisions
    }

    /**
    Find decisions with type exactly as the param given
    parameters: String type,the 4 params for pagination
    return:List decisions
     */
    static def findDecisionByType(String type,int par_max,int par_offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list(max: par_max, offset: par_offset) {
            eq("type",type)
            if (sort){
                order(sort,orderList)
            }
        }
        return decisions
    }

    /**
    Find decisions with geo exactly as the param given
    parameters: Geo geo,the 4 params for pagination
    return:List decisions
     */
    static def findDecisionByPOI(Geo geo,int par_max,int par_offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list(max: par_max, offset: par_offset) {
            eq("geo",geo)
            if (sort){
                order(sort,orderList)
            }
        }
        return decisions
    }

    /**
    Find decisions signed by signer like or exactly as the param given
    parameters: String signer,the 4 params for pagination
    return:List decisions
     */
    static def findDecisionBySigner(String signer,int par_max,int par_offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list(max: par_max, offset: par_offset) {
            like("signer",signer)
            if (sort){
                order(sort,orderList)
            }
        }
        return decisions
    }

    /**
    Find decisions taken by unit like or exactly as the param given
    parameters: String subject,the 4 params for pagination
    return:List decisions
     */
    static def findDecisionByUnit(String unit,int par_max,int par_offset,String sort,String orderList){
        def decisions=Decision.createCriteria().list(max: par_max, offset: par_offset) {
            like("subject",unit)
            if (sort){
                order(sort,orderList)
            }
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

    static def search(){

    }

}
