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
        uid column: "uid", generator: "assigned", sqlType: "varchar(50)"
    }
}
