package com.meerkat

class Unit {
    String label
    String uid
    Boolean active
    Organization parent
    static belongsTo = [geo:Geo]

    String toString(){
        return label
    }
    static constraints = {
        uid(unique: true)
    }
    static mapping = {
        version false
        uid column: "uid", generator: "assigned", sqlType: "varchar(20)"
    }
}
