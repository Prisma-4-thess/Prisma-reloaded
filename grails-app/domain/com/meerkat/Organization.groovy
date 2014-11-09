package com.meerkat

class Organization {
    String uid
    String label
    String abbreviation
    String latinName
    String status
    Organization supervisor
    String website
    String odeManagerEmail
    String vatNumber
    int fekNumber
    int fekIssue
    int fekYear
    static hasMany = [orgDomain:DictionaryItem]
    DictionaryItem category
    static constraints = {
        uid(unique: true,nullable: false)
        label(blank: false)
        odeManagerEmail(email: true,blank: true)
        website(blank: true)
        fekIssue(nullable: true)
        vatNumber(nullable: true)
        supervisor(nullable: true)
        status(inList: ["active", "inactive", "pending"])
    }
}
