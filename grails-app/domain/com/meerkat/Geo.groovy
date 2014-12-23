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
    static hasMany = [decisions: Decision,units:Unit]

    static constraints = {
        latitude(nullable: false)
        longitude(nullable: false)
    }

    String toString() {
        return namegrk
    }
}
