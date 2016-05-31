package com.ttnd.linksharing

import com.ttnd.linksharing.CO.ResourceSearchCo
import com.ttnd.linksharing.Enum.Visiblity
import com.ttnd.linksharing.VO.RatingInfoVo
import com.ttnd.linksharing.VO.TopicVo
import com.ttnd.linksharing.Topic


class ResourceController {

    def index() {
        render "hiiiiiiiiiiii"
    }


    def show(Long id) {
        Resource resource = Resource.findById(id)


        RatingInfoVo ratingInfoVo = resource.ratingInfo
        render "Total score= $ratingInfoVo.totalScore Total votes= $ratingInfoVo.totalVotes average score= $ratingInfoVo.averageScore "

    }

    def showtopics() {   //Resource resource = Resource.findById(id)

        List<TopicVo> topicVo = Topic.trendingTopics()

        //render(template: "/user/trendingTopic", model:[topicVo:"topicVo"] )
        render topicVo

    }

    def search(ResourceSearchCo co) {
        if (co.q)
            co.visiblity = Visiblity.PUBLIC
        println ("+++++++++global properties+++++++++++++++++++${co.topicId}")
        println("co:${co.properties}")
        List<Resource> resources = Resource.search(co).list()
//        render "resources $resources"

        render(template: '/topic/resourceSearch', model: [posts: resources])


    }

    def delete(Long id) {
        Resource resource = Resource.load(id)


        if (resource) {

            try {
                resource.delete(flush: true)
                resource.deleteFile()
                redirect(controller: "user", action: "index")
            } catch (Exception e) {
                render "$e resource could not be found hence could not be deleted"
            }
        }

    }

    def post2(Long id) {
        Resource resource = Resource.findById(id)
        if (resource)
            render(view: "/user/post", model: [post: resource])
        else
            render "failure in getting resource id"


    }


    private def readingItem(Resource resource) {
        Topic topic = resource.topic

        List<User> user = topic.getsubscribedUsers()

        user.each {
            ReadingItem readingItem
            if (it == session.user)
                readingItem = new ReadingItem(resource: resource, user: it, isRead: true)
            else
                readingItem = new ReadingItem(resource: resource, user: it, isRead: false)

            it.addToReadingItems(readingItem)
        }
    }


    def save(Long postId, String description) {
        Resource resource = Resource.get(postId as Long)
        println "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        println resource.contentType
        println("+++++++++++++++++++++++++++++++${resource}+++++++++++++++++++++++++++++++++++++")
        if (resource) {
            resource.description = description
            println resource.contentType
            println "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            if (resource.save(flush: true,failOnError: true)) {
                render("resource updated")
            } else {
                render("resource not found")

            }

        }

    }


}
