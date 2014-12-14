package com.meerkat

class OrgPosition {
    String label
    static constraints = {}
    static mapping = {
        version false
        id column: "orgPosition_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
