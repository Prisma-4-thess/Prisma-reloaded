package com.meerkat

class Dictionary {
    String label
    static hasMany = [items:DictionaryItem]
    static constraints = {
        label(blank: false)
    }
}
