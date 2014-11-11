package com.meerkat

class Decision {
    String ada
    String versionId
    String protocolNumber
    String subject
    Date issueDate
    Type type
    Organization organization
    boolean privateData
    Date submissionTimestamp
    Decision correctedDecision
    static hasMany = [extraFieldValues:ExtraFieldValue,signers:Signer,units:Unit,thematicCategories:DictionaryItem]
    static constraints = {
        ada(unique: "versionId")
    }
}
