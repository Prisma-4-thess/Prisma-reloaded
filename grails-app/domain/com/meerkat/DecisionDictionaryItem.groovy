package com.meerkat

class DecisionDictionaryItem implements Serializable{
    String ada
    String versionId
    DictionaryItem item
    static constraints = {
    }
    static mapping = {
        table: 'decision_thematic'
        version false
        id composite: ['ada','versionId','item']
        ada column: "decision_ada", generator: "assigned", sqlType: "varchar(20)"
        versionId column: "decision_version", generator: "assigned", sqlType: "varchar(50)"
        item column: "them_cat_id", generator: "assigned", sqlType: "varchar(50)"
    }
}
