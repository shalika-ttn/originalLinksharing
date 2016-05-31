package com.ttnd.linksharing

import com.ttnd.linksharing.Enum.Seriousness
import grails.converters.JSON

class SubscriptionController {

    def index() {}

    def save(Long id) {
        Map result = [:]
        Topic topic = Topic.findById(id)
        User user = session.user
        user.refresh()
        println("==============${topic.properties}===================")
        if (topic) {
//            Subscription.withNewSession {

            Subscription subscription = new Subscription(user: session.user, topic: topic, seriousness: Seriousness.SERIOUS)

            if (subscription.save(flush: true, failOnError: true)) {
                List<Resource> resourceList = Resource.findAllByTopic(topic)
                resourceList.each {
                    ReadingItem readingItem = new ReadingItem(resource: it, user: user, isRead: false)
                    if (readingItem?.save(flush: true))
                        user.addToReadingItems(readingItem)
                    else
                        println("++++++++error in adding to readingItem+++++++++")
                }
                result.message = "subscribed successfully"

            } else {
                result.error = "subscribed not saved successfully"

            }
        }
        render result as JSON
    }

    def update(Long id, String seriousness) {
        Map result = [:]
      Topic topic=Topic.findById(id);
        Subscription subscription1 = Subscription.findByTopic(topic)
        if (subscription1) {
            subscription1.seriousness = seriousness as Seriousness
            if (subscription1.save(flush: true)) {
                println("in if")
                result.message = "subscription seriousness updated is saved succesfully"
            } else {
                println("in else")
                result.error = "subscription seriousness updated is not saved succesfully"
            }
        }
        render result as JSON

    }

    def delete(long id) {
        Map result = [:]
        Subscription subscription = Subscription.findById(id)

        if (subscription && subscription.topic.createdBy != session.user) {
            subscription.delete(flush: true)
            result.message = "subscription is delted"
        } else {
            result.error = "subscription can not be deleted"
        }
        render result as JSON


    }
}