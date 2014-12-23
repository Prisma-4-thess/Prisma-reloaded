package com.meerkat

class Decision_dictionary_item implements  Serializable{
    Decision decision
    DictionaryItem item

    static constraints = {
        decision(nullable: false)
    }
    static mapping = {
        version false
        id composite: ['decision','item']
        item column: "dictionary_item_id", generator: "assigned", sqlType: "varchar(50)"
    }
}
