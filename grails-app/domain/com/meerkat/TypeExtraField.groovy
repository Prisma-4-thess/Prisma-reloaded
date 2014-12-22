package com.meerkat

class TypeExtraField implements Serializable{
    Type type
    ExtraField extraField
    Boolean required
    Boolean multiple

    static constraints = {
    }
    static mapping = {
        version false
        id composite: ['type','extraField']
        type column: "parent_id", generator: "assigned", sqlType: "varchar(20)"
        extraField column: "extra_field_id", generator: "assigned", sqlType: "varchar(50)"
    }
}
