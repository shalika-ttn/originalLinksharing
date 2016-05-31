package com.ttnd.linksharing

import com.ttnd.linksharing.CO.UserSearchCo
import com.ttnd.linksharing.Resource
import groovy.transform.EqualsAndHashCode

@EqualsAndHashCode
class User {

    String firstName
    String lastName
    String userName
    String password
    String email
    Byte[] photo
    Boolean admin = false
    Boolean active = true
    Date dateCreated
    Date lastUpdated
    String confirmPassword
    long id
    static transients = ['name', 'confirmPassword', 'subscribedTopics']
    static hasMany = [topics         : Topic, subscriptions: Subscription, resources: Resource, readingItems: ReadingItem,
                      resourceRatings: ResourceRating]

    static mapping = {
        photo(sqlType: 'longblob')
        sort id: 'desc'
//        topics lazy: false
    }

    static constraints = {


        email(unique: true, email: true, blank: false, nullable: false)

        password(nullable: false, blank: false, minSize: 5)
        photo(nullable: true)
        firstName(nullable: false, blank: false)
        lastName(nullable: false, blank: false)
        active(nullable: true)
        admin(nullable: true)
        userName(nullable: false, blank: false, unique: true)


        confirmPassword bindable: true, nullable: true, blank: true, validator: { val, obj ->
            //println "obj:${obj}******${val}"


            if (val) {
                if (obj.password != val) {
                    return false
                }
            }
        }

    }

    static namedQueries = {
        search { UserSearchCo userSearchCO ->
            eq('admin', false)
            if (userSearchCO.active != null) {
                eq("active", userSearchCO.active)
            }

            if (userSearchCO.q) {
                or {
                    ilike("firstName", "%${userSearchCO.q}%")
                    ilike("lastName", "%${userSearchCO.q}%")
                    ilike("email", "%${userSearchCO.q}%")
                    ilike("userName", "%${userSearchCO.q}%")

                }
            }
        }
    }


    String getName() {
        "$firstName $lastName"

    }

    List<Topic> getsubscribedTopics() {
        List<Topic> result = Subscription.createCriteria().list() {


            projections {
                property('topic')
            }


            eq('user.id', this.id)
        }

        result

    }

    Boolean canDeleteResource(Long resourceId) {
        Resource resource = Resource.findById(resourceId)

        if ((resource.createdBy == this) || this?.admin)
            true
        else
            false

    }

    Boolean isSubscribed(Long topicId) {
        Integer subscriptionsCount = Subscription.createCriteria().count() {
            eq('user', this)
            'topic' {
                eq('id', topicId)
            }
        }

        if (subscriptionsCount)
            true
        else
            false

    }

    Subscription getSubscription(Long id) {
        Topic topic = Topic.findById(id)
        Subscription subscription = Subscription.findByUserAndTopic(this, topic)
        subscription

    }

    Boolean equals(User user) {
        this.id == user.id
    }


    static Boolean updatePassword(String newPassword, String email) {

        if (User.executeUpdate("update User set password='${newPassword}' where email='$email'")) {
            println("===================inside if++++++++++++++++++++")
            true
        } else {
            false
        }
    }

    String toString() {
        "$firstName "
    }

}
