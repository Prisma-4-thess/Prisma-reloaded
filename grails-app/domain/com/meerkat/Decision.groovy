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
    }
    static mapping = {
        version false
        id composite: ['ada', 'versionId']
        type column: "type_id", generator: "assigned", sqlType: "varchar(20)"
        subject sqlType: "varchar(2000)"
    }
}
