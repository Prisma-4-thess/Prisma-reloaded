package com.meerkat

class ExtraFieldFixedValueList implements Serializable{
    ExtraField extraField
    String fixedValueList

    static constraints = {
    }
    static mapping = {
        version false
        id composite: ['extraField','fixedValueList']
        extraField column: "extra_field_id",generator: "assigned", sqlType: "varchar(20)"
    }
}
