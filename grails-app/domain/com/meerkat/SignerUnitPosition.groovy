package com.meerkat

class SignerUnitPosition {
    Signer signer
    Unit unit
    OrgPosition position

    static constraints = {

    }
    static mapping = {
        signer column: "signer_id", generator: "assigned", sqlType: "varchar(20)"
        unit column: "unit_id", generator: "assigned", sqlType: "varchar(20)"
        position column: "org_pos_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
