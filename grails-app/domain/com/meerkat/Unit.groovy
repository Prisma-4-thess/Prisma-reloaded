package com.meerkat

class Unit {
    String label
    Boolean active
    Organization parent
    static belongsTo = [geo:Geo]

    static constraints = {

    }
    static mapping = {
        version false
        id column: "unit_id", generator: "assigned", sqlType: "varchar(20)"
        parent column: "org_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
