package com.meerkat

class Decision implements Serializable {
    String ada
    String versionId
    String protocolNumber
    String subject
    long issueDate
    Type type
    Organization organization
    boolean privateData
    long submissionTimestamp
    String correctedVersionId
    static belongsTo = [geo: Geo]
    static constraints = {
    }
    static mapping = {
        version false
        id composite: ['ada', 'versionId']
    }
}
