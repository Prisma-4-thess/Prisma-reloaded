package com.meerkat

class SignerSignUnit implements Serializable{
    Signer signer
    Unit unit

    static constraints = {
    }
    static mapping = {
        id composite: ["signer","unit"]
        version(false)
        signer column: "signer_id", generator: "assigned", sqlType: "varchar(20)"
        unit column: "unit_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
