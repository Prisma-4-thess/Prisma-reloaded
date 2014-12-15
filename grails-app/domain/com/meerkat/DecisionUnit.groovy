package com.meerkat

class DecisionUnit implements Serializable{

    String ada
    String versionId
    Unit unit

    static constraints = {
    }
    static mapping = {
        version false
        id composite: ['ada','versionId','unit']
        ada column: "decision_ada", generator: "assigned", sqlType: "varchar(20)"
        versionId column: "decision_version", generator: "assigned", sqlType: "varchar(50)"
        unit column: "unit_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
