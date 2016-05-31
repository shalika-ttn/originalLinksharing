package com.ttnd.linksharing

import com.ttnd.linksharing.CO.ResourceSearchCo
import com.ttnd.linksharing.DTO.EmailDTO
import com.ttnd.linksharing.Enum.Seriousness
import com.ttnd.linksharing.Enum.Visiblity
import com.ttnd.linksharing.VO.TopicVo
import grails.converters.JSON


class TopicController {
    def emailService

    def index() {
        render "this is topic domain"


    }

    def join(Long topicId) {
        User user = session.user
        if (user) {
            Topic topic = Topic.get(topicId)
            if (topic) {
                Subscription subscription = new Subscription(topic: topic, user: user, seriousness: Seriousness.SERIOUS)
                if (subscription?.save(flush: true)) {
                    flash.message = "Subscription save successfully"
                } else {
                    flash.error = "Subscription not save successfully"
                }
            } else {

                flash.error = "Topic not exist"
            }
        }
        redirect(controller: "login", action: 'index')


    }

    def invite(Long id, String email) {
        Topic topic = Topic.get(id)
        if (topic) {
            TopicVo topicVO = new TopicVo(id: topic.id, name: topic.name, visiblity: topic.visiblity,
                    createdBy: topic.createdBy)
            EmailDTO emailDTO = new EmailDTO(to: [email], subject: "Invitations for topic from linksharing",
                    view: '/email/_invite', model: [currentUser: session.user, topic: topicVO])
            emailService.sendMail(emailDTO)
            flash.message = "Successfully send invitation"
            render(view: '/user/inviteUser')
        } else {
            flash.error = "Can't sent invitation"
            render flash.error
        }

        // redirect(controller: "user", action:"index")


    }

    def show(ResourceSearchCo co) {
        //Topic topic=Topic.findById(id)
        Topic topic = Topic.get(co.topicId)
        if (!topic) {
            flash.message = "topic not found"

            redirect(controller: "Login", action: "index")

        } else {
            if (topic.visiblity == Visiblity.PUBLIC) {
                List<Resource> resourceList = Resource.findAllByTopic(topic)

                render(view: 'show', model: [userlist: topic.subscribedUsers, topics: topic, posts: resourceList])

            } else if (topic.visiblity == Visiblity.PRIVATE) {
                if (Subscription.findByUserAndTopic(topic.createdBy, topic))
                    render "Topic is private and subscription also found but cant be redirected"
                else {
                    flash.message = "subscription not found"
                    redirect(controller: "login", action: "index")
                }
            }

        }


    }


    def save(String name, String visibility) {
        Topic topic = new Topic(name: name, createdBy: session.user, visiblity: Visiblity.convert(visibility))

        if (topic.save()) {
            // flash.message = "Success "
            //render (view: 'dashboard',controller:'user')
            // render flash.message

            render(view: 'save')
        } else {
            log.error(" Could not save Topic ${topic.name}")
            flash.message = "Topic ${topic.name} dosent satisfied constraints"
            render flash.message

        }

    }

    def sent(String email, String name) {
        User user = User.findByEmail(email)
        Topic topic = Topic.findByName(name)

        if (user && topic) {
            Subscription subscription = new Subscription(user: user, topic: topic)

            if (subscription.save()) {
                flash.message = " Subscription saved ------Success "
                render flash.message
            } else {
                log.error(" Could not save subscription ${subscription}")
                flash.message = "Topic ${subscription.properties} dosent satisfied constraints"
                render flash.message

            }
        } else render " Either user email or topic name invalid"

    }

    def update(Long id, String visiblity) {
        Map result = [:]
        Topic topic = Topic.get(id)

        if (topic) {
            topic.visiblity = visiblity as Visiblity
            if (topic.save(flush: true)) {
                println("in if")
                result.message = "topic visiblity updated  saved succesfully"
            } else {
                println("in else")
                result.error = "topic visiblity updated not succesfully"
            }
        }
        println(".............>>${result}")
        render result as JSON

    }

    def topicUpdate(Long topicId, String topicName) {
        Map result = [:]
        Topic topic = Topic.get(topicId)
        println("+++++++++++++++++${topicId}+++++++++++++++++");
        println("${topic.properties}")
        if (topic) {
            topic.name = topicName
            if (topic.save(flush: true))
                result.message = "topic name saved succesfully"
//                render(success: "Topic saved succesfully" as JSON)
            else
                result.error = "topic name cant saved succesfully"
//                render(error: "Topic can not be saved succesfully" as JSON)
        } else
            result.error = "topic cant be found"
//            render(error: "topic can not be found" as JSON)
       render result as JSON
    }

    def delete(Long id) {
        Map result = [:]
        Topic topic = Topic.findById(id)
        if (topic) {
            println("================in if of topic")
            topic.delete(flush: true)
            result.message = "topic deleted succesfully"
        } else
            result.error = "topic cant be deleted succesfully"
        render result as JSON
    }


}
