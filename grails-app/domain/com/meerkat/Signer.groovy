package com.meerkat

class Signer {
    String uid
    String firstName
    String lastName
    boolean active
    Organization org
    boolean hasOrganizatioSignRights
    OrgPosition position
    static constraints = {
        uid(unique: true,nullable: false)
    }
}
