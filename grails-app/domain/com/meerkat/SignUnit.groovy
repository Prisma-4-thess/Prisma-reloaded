package com.meerkat

class SignUnit {
    String positionLabel
    OrgPosition positionId
    static constraints = {
    }
    static mapping = {
        version false
        id column: "sign_unit_id", generator: "assigned", sqlType: "varchar(20)"
        positionId column: "position_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
