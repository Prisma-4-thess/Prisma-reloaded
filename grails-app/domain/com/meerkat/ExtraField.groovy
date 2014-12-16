package com.meerkat

class ExtraField {
    String label
    String help
    String type
    String validation
    Integer maxLength
    String searchTerm
    String dictionary
    Boolean relAdaConstrainedInOrganization
    static belongsTo = Type

    static constraints = {

    }
    static mapping = {
        version false
        id column: "extraField_id", generator: "assigned", sqlType: "varchar(50)"
    }
}
