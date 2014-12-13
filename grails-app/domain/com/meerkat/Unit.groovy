package com.meerkat

class Unit {
    String id
    String label
    String abbreviation
    boolean active
    Organization parent
    DictionaryItem category
    static hasMany = [unitDomains:DictionaryItem]

    static constraints = {
        id(unique: true,nullable: false)
        parent(nullable: false)
    }
    static mapping = {
        version false
        id column:'unit_id',generator: 'assigned'
    }
}
