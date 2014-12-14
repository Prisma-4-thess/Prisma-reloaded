package com.meerkat

class ExtraFieldValue {
    String value
    ExtraField ownerExtraField
    static constraints = {
        ownerExtraField(nullable: true)
    }
}
