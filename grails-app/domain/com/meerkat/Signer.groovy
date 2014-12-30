package com.meerkat

class Signer {
    String firstName
    String lastName
    String uid
    Boolean active
    Organization org
    Long activeFrom
    Long activeUntil

    String toString(){
        return firstName+" "+lastName
    }
    static constraints = {
        uid(unique: true)

    }
    static mapping = {
        version false
        uid column: "uid", generator: "assigned", sqlType: "varchar(20)"
    }
}
