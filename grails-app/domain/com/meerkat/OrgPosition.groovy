package com.meerkat

class OrgPosition {
    String id
    String label
    static constraints = {
        id(unique: true,nullable: false)
        label(blank: false)
    }
    static mapping = {
        version false
        id column: 'orgPosition_id'
    }
}
