package com.meerkat

class DecisionExtraFieldValue implements Serializable{
    String ada
    String versionId
    ExtraFieldValue value

    static constraints = {

    }
    static mapping = {
        version false
        id composite: ['ada','versionId','value']
        ada column: "decision_ada", generator: "assigned", sqlType: "varchar(20)"
        versionId column: "decision_version", generator: "assigned", sqlType: "varchar(50)"
    }

}
