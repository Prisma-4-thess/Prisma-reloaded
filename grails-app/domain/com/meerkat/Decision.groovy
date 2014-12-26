package com.meerkat

class Decision{
    String ada
    String versionId
    String protocolNumber
    String subject
    long issueDate
    Type type
    String correctedVersionId
    static belongsTo = [geo: Geo]
    static hasMany = [extraFields:ExtraField,thematic_cat:DictionaryItem,signers:Signer,units:Unit]
    static constraints = {
        issueDate(null:false)
        ada(unique: "versionId")
    }
    static mapping = {
        version false
        subject sqlType: "varchar(2000)"
    }
}
