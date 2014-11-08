package com.meerkat

class DictionaryItem {
    String label
    DictionaryItem parent
    static constraints = {
        label(blank: false)
        parent(nullable: true)
    }
}
