package com.meerkat

class DictionaryItem {
    String label
    String uid
    static constraints = {
        label(nullable: false)
        uid(unique: true)
    }
    static mapping = {
        version false
        uid column: "dictionary_item_id", generator: "assigned", sqlType: "varchar(50)"
    }
}
