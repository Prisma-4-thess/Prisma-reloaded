package com.meerkat

class Signer_unit_decision implements Serializable{
    Decision decision
    Unit unit
    Signer signer
    String position

    static constraints = {
        unit(nullable: false)
        signer(nullable: false)
        position(nullable: false)
        decision(nullable: false)
    }
    static mapping = {
        version false
        id composite: ['decision','signer','unit','position']
        unit column: "unit_id", generator: "assigned", sqlType: "varchar(20)"
        signer column: "signer_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
