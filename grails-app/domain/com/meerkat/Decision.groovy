package com.meerkat

class Decision implements Serializable {
    String ada
    String versionId
    String protocolNumber
    String subject
    long issueDate
    Type type
    String correctedVersionId
    static belongsTo = [geo: Geo]
    static hasMany = [extraFields:ExtraField]
    static constraints = {
        issueDate(null:false)
        ada(unique: "versionId")
    }
    static mapping = {
        version false
        subject sqlType: "varchar(2000)"
    }
}
