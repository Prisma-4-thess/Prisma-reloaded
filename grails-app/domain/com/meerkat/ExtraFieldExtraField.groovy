package com.meerkat

class ExtraFieldExtraField implements Serializable{
    ExtraField extraField1
    ExtraField extraField2

    static constraints = {

    }
    static mapping = {
        version false
        id composite: ['extraField1','extraField2']
        extraField1 column: "extra_field1_id", generator: "assigned", sqlType: "varchar(20)"
        extraField2 column: "extra_field2_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
