package com.ttnd.linksharing

import com.ttnd.linksharing.Enum.Seriousness
import groovy.transform.EqualsAndHashCode

@EqualsAndHashCode
class Subscription {

    Date dateCreated
    Date lastUpdated
    Seriousness seriousness =Seriousness.SERIOUS
    static belongsTo = [user: User, topic: Topic]
    static constraints = {
        user(nullable: false)
        topic(nullable: false, unique: 'user')


    }


    def afterInsert()
    {

    }

}
