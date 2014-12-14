package com.meerkat

class Unit {
    String label
    String abbreviation
    Boolean active
    Organization parent
    DictionaryItem category
    static hasMany = [unitDomains: DictionaryItem]

    static constraints = {
        parent(nullable: true)
    }
    static mapping = {
        version false
        id column: "unit_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
