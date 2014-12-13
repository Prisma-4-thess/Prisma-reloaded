package com.meerkat

class Decision implements Serializable {
    String ada
    int versionId
    String protocolNumber
    String subject
    long issueDate
    Type type
    Organization organization
    boolean privateData
    long submissionTimestamp
    Decision correctedDecision
    static hasMany = [extraFieldValues:ExtraFieldValue,signers:Signer,units:Unit,thematicCategories:DictionaryItem]
    static constraints = {
        ada(unique: "versionId")
    }
    static mapping = {
        version false
        id composite: ['ada','versionId']
    }
}
