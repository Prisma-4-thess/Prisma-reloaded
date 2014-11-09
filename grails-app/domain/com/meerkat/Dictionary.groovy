package com.meerkat

class Dictionary {
    String uid
    String label
    static hasMany = [items:DictionaryItem]
    static constraints = {
        uid(unique: true,nullable: false)
        label(blank: false)
    }
}
