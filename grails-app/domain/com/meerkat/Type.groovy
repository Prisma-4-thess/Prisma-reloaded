package com.meerkat

class Type {
    String label
    Type parent
    Boolean allowedInDecision
    static constraints = {

    }
    static mapping = {
        version false
        id column: "type_id", generator: "assigned", sqlType: "varchar(20)"
        parent column: "parent_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
