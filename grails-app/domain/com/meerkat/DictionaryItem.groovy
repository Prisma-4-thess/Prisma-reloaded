package com.meerkat

class DictionaryItem {
    String id
    String label
    DictionaryItem parent
    static belongsTo = [dictionary:Dictionary]
    static constraints = {
        id(unique: true,nullable: false)
        label(blank: false)
        parent(nullable: true)
    }
    static mapping = {
        version false
        id column: 'dictionaryItem_id'
    }
}
