package com.meerkat

class Type {
    String id
    String label
    Type parent
    boolean allowedInDecision
    static hasMany = [extraFields:ExtraField]
    static constraints = {
        id(unique: true,nullable: false)
    }
    static mapping = {
        version false
        id column: 'type_id',generator: 'assigned',sqlType: "varchar(20)"
    }
}
