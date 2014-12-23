package com.meerkat

class ExtraField {
    Decision decision
    String extra_field_name
    String extra_field_value
    static constraints = {
        extra_field_name(nullable: false)
        extra_field_value(nullable: false)
        decision(nullable: false)
    }
    static mapping = {
        version false
    }
}
