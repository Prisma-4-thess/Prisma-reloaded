package com.meerkat

class DictionaryItem {
    String label
    static constraints = {
        label(nullable: false)
    }
    static mapping = {
        version false
        id column: "dictionary_item_id", generator: "assigned", sqlType: "varchar(50)"
    }
}
