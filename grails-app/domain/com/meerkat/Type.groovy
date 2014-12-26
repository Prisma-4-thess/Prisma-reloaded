package com.meerkat

class Type {
    String label
    String uid
    static constraints = {
        label(nullable: false)
        uid(unique: true)
    }
    static mapping = {
        version false
        uid column: "type_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
