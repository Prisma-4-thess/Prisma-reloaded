package com.meerkat

class Unit {
    String label
    String abbreviation
    boolean active
    Organization parent

    static constraints = {
        parent(nullable: false)
    }
}
