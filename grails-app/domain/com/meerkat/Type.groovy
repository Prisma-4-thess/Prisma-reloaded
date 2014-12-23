package com.meerkat

class Type {
    String label
    static constraints = {
        label(nullable: false)
    }
    static mapping = {
        version false
        id column: "type_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
