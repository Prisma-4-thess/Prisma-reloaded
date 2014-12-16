package com.meerkat

class ExtraFieldValue {
    String value
    ExtraField ownerExtraField
    static constraints = {
        ownerExtraField(nullable: true)
    }
    static mapping = {
        version false
        ownerExtraField column: "extra_field_id", generator: "assigned", sqlType: "varchar(50)"
    }
}
