package com.meerkat

class ExtraField {
    String uid
    String label
    String help
    String type
    String validation
    boolean required
    boolean multiple
    int maxLength
    String searchTerm
    String dictionary
    boolean relAdaConstrainedInOrganization
    static belongsTo = Type
    static hasMany = [fixedValueList:String,relAdaDecisionTypes:Type,nestedFields:ExtraField]

    static constraints = {
        type(inList: ["integer", "string", "object"])
        validation(inList: ["ada", "dictionary", "fixedValueList","afm","orgStructure"])
        dictionary(nullable: true)
        fixedValueList(nullable: true)
        relAdaDecisionTypes(nullable: true)
        relAdaConstrainedInOrganization(nullable:true)
        nestedFields(nullable: true)
    }
}
