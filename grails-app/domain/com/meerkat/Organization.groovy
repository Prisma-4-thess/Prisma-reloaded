package com.meerkat

class Organization {
    String label
    String uid
    String status
    String website
    String odeManagerEmail
    String vatNumber
    static constraints = {
        label(nullable: false)
        uid(unique: true)
    }
    static mapping = {
        version false
        uid column: "uid", generator: "assigned", sqlType: "varchar(20)"
    }

    String toString(){
        return label
    }

}
