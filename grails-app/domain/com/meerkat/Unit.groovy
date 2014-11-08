package com.meerkat

class Unit {
    String label
    String abbreviation
    boolean active
    Organization parent
    DictionaryItem category
    static hasMany = [unitDomains:DictionaryItem]

    static constraints = {
        parent(nullable: false)
    }
}
