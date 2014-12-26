package com.meerkat

class Unit {
    String label
    String uid
    Boolean active
    Organization parent
    static belongsTo = [geo:Geo]

    static constraints = {
        uid(unique: true)
    }
    static mapping = {
        version false
        uid column: "unit_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
