package com.meerkat

class OrgPosition {
    String uid
    String label
    static constraints = {
        uid(unique: true,nullable: false)
        label(blank: false)
    }
}
