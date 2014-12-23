package com.meerkat

class Signer_unit implements Serializable{
    Signer signer
    Unit unit
    String position

    static constraints = {
    }
    static mapping = {
        version false
        id composite: ['signer','unit','position']
        signer column: "signer_id", generator: "assigned", sqlType: "varchar(20)"
        unit column: "unit_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
