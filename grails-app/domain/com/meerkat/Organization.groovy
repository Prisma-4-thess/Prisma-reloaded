package com.meerkat

class Organization {

    String label
    String abbreviation
    String latinName
    enum Status{ACTIVE,INACTIVE,PENDING}
    Organization supervisor
    String website
    String odeManagerEmail
    String vatNumber
    int fekNumber
    int fekIssue
    int fekYear
    static constraints = {
        label(blank: false)
        supervisor(nullable: true)
        odeManagerEmail(email: true,blank: true)
        website(blank: true)
        fekIssue(nullable: true)
        vatNumber(nullable: true)
        supervisor(nullable: true)
    }
}
