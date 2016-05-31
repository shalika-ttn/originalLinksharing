package com.ttnd.linksharing

import groovy.transform.EqualsAndHashCode

@EqualsAndHashCode
class ResourceRating {


    Integer score
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user: User, resource: Resource]


    static constraints = {

        score(nullable: false, min: 1, max: 5)
        resource(unique: 'user', nullable: false)
    }

    static  List showTopPost() {
        List result = ResourceRating.createCriteria().list() {

            projections {
                groupProperty('resource.id')
                count('score', 'res')
            }
            order('res',"desc")
            maxResults 5



        }
     result

    }
    static  List showRecentPost() {
        List result = Resource.createCriteria().list([sort:'dateCreated',max:3]) {

            projections {
                groupProperty('id')

            }
            order('id',"desc")
            maxResults 5



        }
        result

    }

}
