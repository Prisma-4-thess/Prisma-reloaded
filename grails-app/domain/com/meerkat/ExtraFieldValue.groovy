package com.meerkat

class ExtraFieldValue {
    String value
    ExtraField ownerExtraField
    static constraints = {
        value(blank: false)
    }
}
