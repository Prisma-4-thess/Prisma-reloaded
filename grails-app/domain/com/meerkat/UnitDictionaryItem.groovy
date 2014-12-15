package com.meerkat

class UnitDictionaryItem implements Serializable{
    Unit unit
    DictionaryItem item

    static constraints = {

    }
    static mapping = {
        version false
        id composite: ['unit','item']
        item column: "item_id", generator: "assigned", sqlType: "varchar(20)"
        unit column: "unit_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
