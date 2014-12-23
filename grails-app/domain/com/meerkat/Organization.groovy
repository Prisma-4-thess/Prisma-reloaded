package com.meerkat

class Organization {
    String label
    String status
    String website
    String odeManagerEmail
    String vatNumber
    static constraints = {
        label(nullable: false)
    }
    static mapping = {
        version false
        id column: "organization_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
