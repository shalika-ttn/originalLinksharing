import com.ttnd.linksharing.DocumentResource
import com.ttnd.linksharing.Enum.Seriousness
import com.ttnd.linksharing.Enum.Visiblity
import com.ttnd.linksharing.LinkResource
import com.ttnd.linksharing.ReadingItem
import com.ttnd.linksharing.Resource
import com.ttnd.linksharing.ResourceRating
import com.ttnd.linksharing.Subscription
import com.ttnd.linksharing.Topic
import com.ttnd.linksharing.User
import com.ttnd.linksharing.Constants.Constant


class BootStrap {

    def grailsApplication
    def messageSource

    def init = { servletContext ->

        println(grailsApplication.config.grails.shalika)
        List<User> users = createUsers()
        List<Topic> topics = createTopics(users)
        List<Resource> resources = createResources(topics)
        subscribeTopics(topics, users)
        List<ReadingItem> readingItems = createReadingItems()
        List<ResourceRating> resourceRatings = createResourceRating(users)
    }

    List<User> createUsers() {
        List<User> users = []
        if (User.count == 0) {
            User user1 = new User(firstName: "shalika", lastName: "singhal", email: "shalika.singhal@tothenew.com",
                    password: Constant.DEFAULT_PASSWD, userName: "sha", admin: true, active: true, confirmPassword: "abcd10");
            // println "=++++++++++++++++++++++++++++++++++++ ${messageSource.getMessage('com.ttnd.linksharing.User.email.nullable', null)}"

            User user2 = new User(firstName: "saloni", lastName: "sharma", email: "saloni.sharma@tothenew.com",
                    password: Constant.DEFAULT_PASSWD, userName: "sal",
                    admin: false, active: true, confirmPassword: "abcd10");
            try {
                if (user1.save(flush: true)) {
                    users.add(user1)
                    log.info "User ${user1} saved successfully"
                } else {
                    //println(it)
                    user1.errors.allErrors.each {
                        println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${it.defaultMessage}")
                    }
                }
            }
            catch (Exception e) {
                log.error "Error saving user : ${user1.errors.allErrors}"
                user1.errors.allErrors.each {
                    println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${it.defaultMessage}")
                }
            }
            try {
                if (user2.save(flush: true, failOnError: true)) {
                    users.add(user2)
                    log.info "User ${user2} saved successfully"
                }
            } catch (Exception e) {
                log.error "Error saving user : ${user2.errors.allErrors}"
            }

        } else {
            users = User.list()
        }
        users
    }

    List<Topic> createTopics(List<User> users) {
        List<Topic> topics = []
        if (Topic.count == 0) {

            (1..5).each {
                Topic topic = new Topic(name: "Topic${it}", createdBy: users[0], visiblity: Visiblity.PUBLIC)
                if (users[0].addToTopics(topic).save(flush: true)) {
                    topics.add(topic)
                    users[0].addToTopics(topic)
                    log.info "topic ${topic.name} saved successfully"
                } else {
                    log.error "Error saving topic : ${topic.name}"
                }
            }
            (1..5).each {
                Topic topic = new Topic(name: "new_Topic${it}", createdBy: users[1], visiblity: Visiblity.PUBLIC)
                if (users[1].addToTopics(topic).save(flush: true)) {
                    topics.add(topic)
                    users[1].addToTopics(topic)
                    log.info "topic ${topic.name} saved successfully"
                } else {
                    log.error "Error saving topic : ${topic.name}"
                }
            }

            topics
        } else {
            log.error("table not empty")
            Topic.list()
        }
    }

    List<Resource> createResources(List<Topic> topics) {
        List<Resource> resources = []
        if (!Resource.list()) {
            topics.each { topic ->

                Resource linkResource1 = new LinkResource(url: "ftp://foo.bar.com/", description: "this for topic ${topic.name} ",
                        createdBy: topic.createdBy, topic: topic)
                if (linkResource1.save()) {
                    resources.add(linkResource1)
                    topic.addToResources(linkResource1)
                    topic.createdBy.addToResources(linkResource1)
                } else
                    log.error "Error saving resource : ${linkResource1.errors.allErrors}"
                Resource linkResource2 = new LinkResource(url: "ftp://foo.bar.com/", description: "this is  for topic ${topic.name}",
                        createdBy: topic.createdBy, topic: topic)
                if (linkResource2.save()) {
                    resources.add(linkResource2)
                    topic.addToResources(linkResource2)
                    topic.createdBy.addToResources(linkResource2)
                } else
                    log.error "Error saving resource : ${linkResource2.errors.allErrors}"

                Resource documentResource1 = new DocumentResource(createdBy: topic.createdBy, topic: topic, description: "this doc for ${topic.name}",
                        filepath: "hello/d2", contentType: Constant.DOCUMENT_CONTENT_TYPE)
                if (documentResource1.save()) {
                    resources.add(documentResource1)
                    topic.addToResources(documentResource1)
                    topic.createdBy.addToResources(documentResource1)
                } else
                    log.error "Error saving resource : ${documentResource1.errors.allErrors}"

                Resource documentResource2 = new DocumentResource(createdBy: topic.createdBy, topic: topic, description: "this doc is for ${topic.name}",
                        filepath: "hello/d2", contentType: Constant.DOCUMENT_CONTENT_TYPE)
                if (documentResource2.save()) {
                    resources.add(documentResource2)
                    topic.addToResources(documentResource2)
                    topic.createdBy.addToResources(documentResource2)
                } else
                    log.error "Error saving resource : ${documentResource2.errors.allErrors}"


            }

            resources
        } else {
            log.error("resources created")
            resources.addAll(LinkResource.list())
            resources.addAll(DocumentResource.list())
            resources
        }
    }
    // Resouces which are not created by the topic subscribed by user should have that resource in their reading item

//    List<ReadingItem> createReadingItems() {
//        List<User> users = User.list()
//        List<Topic> topics = Topic.list()
//        List<ReadingItem> readingItems = []
//       if(!ReadingItem.count) {
//           users.each { user ->
//               topics.each { topic ->
//                   if (Subscription.findByUserAndTopic(user, topic)) {
//                       topic.resources.each { resource ->
//                           if (resource.createdBy != user && !user.readingItems?.contains(resource)) {
//                               ReadingItem readingItem = new ReadingItem(user: user, resource: resource, isRead: false)
//                               if (readingItem.save()) {
//                                   readingItems.add(readingItem)
//                                   user.addToReadingItems(readingItem)
//                                   log.info "${readingItem} saved successfully"
//                               } else
//                                   log.error "Error saving ${readingItem.errors.allErrors}"
//                           }
//                       }
//                   }
//               }
//           }
//       }
//        return readingItems
//    }


    List<ReadingItem> createReadingItems() {
        println("+++++++++++++++++++++++++++++++++enter newwwwwwwwwwwwwww111111111")
        List<User> users = User.list()
        List<Topic> topics = Topic.list()
        List<ReadingItem> readingItems = []
        if (!ReadingItem.count) {
            println("+++++++++++++++++++++++++++++++++enter newwwwwwwwwwwwwww")
        }
        users.each { user ->
            println("+++++++++++++++++++++++++++++++${user.properties}")
            Resource.findAllByCreatedByNotEqual(user).each { resource ->
                ReadingItem readingItem = new ReadingItem(user: user, resource: resource, isRead: false)
                if (readingItem.save(flush: true)) {
                    readingItems.add(readingItem)
                    user.addToReadingItems(readingItem)
                    log.info "${readingItem} saved successfully"
                    println("+++++++++++++++++++++++++++++++++enter 2")

                } else
                    log.error "Error saving ${readingItem.errors.allErrors}"

            }
        }
    }

    List<ResourceRating> createResourceRating(List<User> users) {
        List<ReadingItem> readingItems1 = []
        List<ResourceRating> resourceRatings = []
        users.each { user ->
            readingItems1 = ReadingItem.findAllByUser(user)
            readingItems1.each { readingItems2 ->
                if (!readingItems2.isRead) {
                    ResourceRating resourceRating = new ResourceRating(user: readingItems2.user, resource: readingItems2.resource,
                            score: 3)

                    if (resourceRating.save()) {

                        resourceRatings.add(resourceRating)
                        user.addToResourceRatings(resourceRating)
                        log.info "${resourceRating} saved successfully"
                    } else
                        log.error "Error saving ${resourceRating.errors.allErrors}"
                }
            }

        }

        resourceRatings

    }


    void subscribeTopics(List<Topic> topics, List<User> users) {
        List<Topic> topic2 = []
        // List <Topic> topic3=[]
//        if (users.size() <= 2) {
        if (!Subscription.count) {

            users.each { User user ->


                topic2 = Topic.findAllByCreatedByNotInList([user])
                println "***************here ${topic2}"
                topic2.each {

                    Subscription subscription = new Subscription(topic: it, user: user, seriousness: Seriousness.VERY_SERIOUS)
                    if (subscription.save(flush: true))
                        log.info "subscription saved succesfully"
                    else
                        log.error "Error saving resource : ${subscription.errors.allErrors}"


                }
            }

//        }
        }
    }

    def destroy = {
    }
}
