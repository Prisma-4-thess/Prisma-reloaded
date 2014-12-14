package com.meerkat

class SignUnit {
    String positionLabel
    OrgPosition positionId
    static constraints = {
    }
    static mapping = {
        version false
        id column: "signUnit_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
