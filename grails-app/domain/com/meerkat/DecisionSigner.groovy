package com.meerkat

class DecisionSigner implements Serializable{

    String ada
    String versionId
    Signer signer
    static constraints = {
    }
    static mapping = {
        version false
        id composite: ['ada','versionId','signer']
        ada column: "decision_ada", generator: "assigned", sqlType: "varchar(20)"
        versionId column: "decision_version", generator: "assigned", sqlType: "varchar(50)"
        signer column: "signer_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
