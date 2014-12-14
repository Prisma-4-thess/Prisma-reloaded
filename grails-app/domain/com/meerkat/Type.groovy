package com.meerkat

class Type {
    String label
    Type parent
    Boolean allowedInDecision
    static hasMany = [extraFields: ExtraField]
    static constraints = {

    }
    static mapping = {
        version false
        id column: "type_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
