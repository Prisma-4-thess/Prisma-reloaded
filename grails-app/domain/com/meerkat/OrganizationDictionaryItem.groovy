package com.meerkat

class OrganizationDictionaryItem implements Serializable{
    OrgPosition organization
    DictionaryItem item

    static constraints = {
    }
    static mapping = {
        version false
        id composite: ['organization','item']
        item column: "item_id", generator: "assigned", sqlType: "varchar(50)"
        organization column: "organization_id", generator: "assigned", sqlType: "varchar(20)"
    }
}
