package com.meerkat

class Signer_unit{
    Signer signer
    Unit unit
    String position

    static constraints = {
        signer(unique: ["unit","position"])
    }
    static mapping = {
        version false
    }
}
