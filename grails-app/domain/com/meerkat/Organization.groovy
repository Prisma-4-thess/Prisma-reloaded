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
    DictionaryItem category
    static constraints = {
        supervisor(nullable: true)
    }
    static mapping = {
        version false
        id column: "organization_id", generator: "assigned", sqlType: "varchar(20)"
        category column: "category_id", generator: "assigned", sqlType: "varchar(20)"
        supervisor column: "supervisor_id", generator: "assigned", sqlType: "varchar(20)"
        fekIssue column: "fek_issue_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
