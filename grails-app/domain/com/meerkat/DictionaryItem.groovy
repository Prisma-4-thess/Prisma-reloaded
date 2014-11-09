package com.meerkat

class DictionaryItem {
    String uid
    String label
    DictionaryItem parent
    static belongsTo = [dictionary:Dictionary]
    static constraints = {
        uid(unique: true,nullable: false)
        label(blank: false)
        parent(nullable: true)
    }
}
