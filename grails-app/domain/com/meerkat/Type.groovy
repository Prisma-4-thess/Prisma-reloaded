package com.meerkat

class Type {
    String label
    String uid

    String toString(){
        return label
    }
    static constraints = {
        label(nullable: false)
        uid(unique: true)
    }
    static mapping = {
        version false
        uid column: "uid", generator: "assigned", sqlType: "varchar(20)"
    }
}
