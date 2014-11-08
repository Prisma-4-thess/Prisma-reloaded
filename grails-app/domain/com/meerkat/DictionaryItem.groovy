package com.meerkat

class DictionaryItem {
    String label
    DictionaryItem parent
    static belongsTo = [dictionary:Dictionary]
    static constraints = {
        label(blank: false)
        parent(nullable: true)
    }
}
