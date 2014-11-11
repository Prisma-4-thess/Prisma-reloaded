package com.meerkat

class Type {

    String uid
    String label
    Type parent
    boolean allowedInDecision
    static hasMany = [extraFields:ExtraField]
    static constraints = {
        uid(unique: true,nullable: false)
    }
}
