package com.meerkat

class Decision_unit implements Serializable{
    Decision decision
    Unit unit

    static constraints = {
        decision(nullable: false)
    }
    static mapping = {
        version false
        id composite: ['decision','unit']
        unit column: "unit_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
