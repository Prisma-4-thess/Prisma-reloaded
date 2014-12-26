package com.meerkat

class Decision_dictionary_item implements  Serializable{
    Decision decision
    DictionaryItem item

    static constraints = {
        decision(nullable: false,unique: "item")
    }
    static mapping = {
        version false
    }
}
