package com.meerkat

class Signer {
    String firstName
    String lastName
    Boolean active
    Organization org
    Long activeFrom
    Long activeUntil
    Boolean hasOrganizationSignRights
    static constraints = {

    }
    static mapping = {
        version false
        id column: "signer_id", generator: "assigned", sqlType: "varchar(20)"
        org column: "org_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
