package com.meerkat

import org.apache.maven.model.Organization

class Signer {
    String firstName
    String lastName
    boolean active
    Organization org
    boolean hasOrganizatioSignRights

    static constraints = {

    }
}
