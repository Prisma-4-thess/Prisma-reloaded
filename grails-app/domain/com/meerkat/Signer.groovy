package com.meerkat

class Signer {
    String firstName
    String lastName
    String uid
    Boolean active
    Organization org
    Long activeFrom
    Long activeUntil
    static constraints = {
        uid(unique: true)

    }
    static mapping = {
        version false
        uid column: "signer_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
