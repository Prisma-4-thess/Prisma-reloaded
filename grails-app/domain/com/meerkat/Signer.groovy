package com.meerkat

class Signer {
    String id
    String firstName
    String lastName
    boolean active
    Organization org
    long activeFrom
    long activeUntil
    boolean hasOrganizationSignRights
    static hasMany = [signUnits:SignUnit]
    static constraints = {
        id(unique: true,nullable: false)
    }
    static mapping = {
        version false
        id column: 'signer_id',generator: 'assigned',sqlType: "varchar(20)"
    }
}
