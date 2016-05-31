package com.ttnd.linksharing

import groovy.transform.EqualsAndHashCode


@EqualsAndHashCode
class ReadingItem {

    Boolean isRead
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user: User, resource: Resource]
    static constraints = {
        resource(unique: 'user', nullable: false)
        user(nullable: false)

    }


}
