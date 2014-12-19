package com.meerkat

class DictionaryItem {
    String label
    DictionaryItem parent
    static belongsTo = [dictionary: Dictionary]
    static constraints = {
        dictionary(nullable: true)
    }
    static mapping = {
        version false
        id column: "dictionaryItem_id", generator: "assigned", sqlType: "varchar(50)"
        dictionary column: "dictionary_id",generator: "assigned", sqlType: "varchar(50)"
        parent column: "parent_id",generator: "assigned", sqlType: "varchar(50)"
    }
}
