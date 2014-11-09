package com.meerkat

class Unit {
    String uid
    String label
    String abbreviation
    boolean active
    Organization parent
    DictionaryItem category
    static hasMany = [unitDomains:DictionaryItem]

    static constraints = {
        uid(unique: true,nullable: false)
        parent(nullable: false)
    }
}
