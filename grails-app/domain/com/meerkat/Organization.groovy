package com.meerkat

class Organization {
    String label
    String abbreviation
    String latinName
    String status
    Organization supervisor
    String website
    String odeManagerEmail
    String vatNumber
    Integer fekNumber
    DictionaryItem fekIssue
    Integer fekYear
    static hasMany = [orgDomain: DictionaryItem]
    DictionaryItem category
    static constraints = {
        supervisor(nullable: true)
    }
    static mapping = {
        version false
        id column: "organization_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
