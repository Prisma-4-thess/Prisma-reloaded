package com.meerkat

class Geo {
    double latitude
    double longitude
    String address
    String tk
    String newCat
    String namegrk
    String phone
    String dimos
    String newSubCat
    static hasMany = [decisions: Decision]

    static constraints = {
        latitude(nullable: false)
        longitude(nullable: false)
        address(nullable: true)
        tk(nullable: true)
        newCat(nullable: true)
        namegrk(nullable: true)
        phone(nullable: true)
        dimos(nullable: true)
        newSubCat(nullable: true)
        decisions(nullable: true)
    }

    String toString() {
        return namegrk
    }
}
