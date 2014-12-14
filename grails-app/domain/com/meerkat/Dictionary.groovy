package com.meerkat

class Dictionary {
    String label
    static hasMany = [items: DictionaryItem]
    static constraints = {
        items(nullable: true)
    }
    static mapping = {
        version false
        id column: "dictionary_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
