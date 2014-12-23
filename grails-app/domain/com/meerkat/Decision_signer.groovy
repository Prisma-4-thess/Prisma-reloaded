package com.meerkat

class Decision_signer {
    Decision decision
    Signer signer

    static constraints = {
        decision(nullable: false)
    }
    static mapping = {
        version false
        id composite: ['decision','signer']
        signer column: "signer_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
