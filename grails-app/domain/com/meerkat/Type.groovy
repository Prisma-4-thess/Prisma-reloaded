package com.meerkat

class Type {
    String uid
    String label


    static constraints = {
        uid(unique: true,nullable: false)
    }
}
