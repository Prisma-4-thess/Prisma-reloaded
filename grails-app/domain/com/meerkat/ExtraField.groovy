package com.meerkat

class ExtraField {
    String label
    String help
    String type
    String validation
    Boolean required
    Boolean multiple
    Integer maxLength
    String searchTerm
    String dictionary
    Boolean relAdaConstrainedInOrganization
    static belongsTo = Type
    static hasMany = [fixedValueList: String, relAdaDecisionTypes: Type, nestedFields: ExtraField]

    static constraints = {

    }
    static mapping = {
        version false
        id column: "extraField_id", generator: "assigned", sqlType: "varchar(20)"
        relAdaDecisionTypes column: "rel_adaPdecision_type_id", generator: "assigned", sqlType: "varchar(20)"
        nestedFields column: "nested_field_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
