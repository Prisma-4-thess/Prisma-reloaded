package com.meerkat

class ExtraFieldType implements Serializable{
    ExtraField extraField
    Type type

    static constraints = {
    }
    static mapping = {
        version false
        id composite: ['extraField','type']
        extraField column: "extra_field_id", generator: "assigned", sqlType: "varchar(20)"
        type column: "type_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
