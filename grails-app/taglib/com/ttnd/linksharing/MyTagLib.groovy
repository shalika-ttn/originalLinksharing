package com.ttnd.linksharing

import com.ttnd.linksharing.Enum.Seriousness
import com.ttnd.linksharing.Enum.Visiblity
import com.ttnd.linksharing.VO.TopicVo

class MyTagLib {
//    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "ls"

    def checkIsRead = { attrs, body ->
        Closure u = {

            "Mark as unread"
        }

        Closure m = {

            "Mark as read"
        }

        if (session.user) {

            if (attrs.isRead)
//                out << "<a href='#'>Mark as unread </a>"
                out << g.link(controller: "readingItems", class: "ajaxLink ${attrs.resourceId}", action: "changeIsRead", onclick: "markread(${attrs.resourceId},${attrs.isRead})", params: [id: attrs.resourceId, isRead: false], u())
            else
//                out << "<a href='#'>Mark  as read</a>"
                out << g.link(controller: "readingItems", class: "ajaxLink ${attrs.resourceId}", action: "changeIsRead", onclick: "markread(${attrs.resourceId},${attrs.isRead})", params: [id: attrs.resourceId, isRead: true], m())

        }
    }

    def topPost = {

        List<Resource> resources = Resource.resourcePost()

        out << render(template: "/login/topPost", model: [resources: resources])

    }
    def trendingTopics = {
        if (session.user) {
            List<TopicVo> topicVos = Topic.trendingTopics()

            out << render(template: "/user/trendingTopic", model: [trendingTopics: topicVos])
        }

    }
    def canDeleteResources = { attrs, body ->

        Closure c = {

            "Delete"
        }

        if (session.user) {
            User user = session.user
            if (user.canDeleteResource(attrs.resourceId)) {
                out << g.link(controller: "resource", action: "delete", params: [id: attrs.resourceId], c())
            }


        }
    }


    def checkResourceType = { attrs ->
        if (session.user) {
            Resource resource = Resource.read(attrs.resource)
            if (resource instanceof LinkResource) {
                out << g.link(controller: 'linkResource', action: 'viewFullSite', params: [id: attrs.resource], {
                    "ViewFullSite "
                })


            } else if (resource instanceof DocumentResource) {
                out << g.link(controller: 'documentResource', action: 'download', params: [id: attrs.resource], {
                    "Download "
                })

            }
        }

    }


    def unSubscribed = { attrs, body ->
        if (session.user) {
            Long id = attrs.long('topicId')

            User user = session.user
            if (user.isSubscribed(attrs.long('topicId'))) {
                out << g.link(class: 'unsubscribe', onclick: "unsubscribe(${id})", id: "${id}", { "Unsubscribe" })

            } else {
                String subscribe = "${createLink(controller: 'subscription', action: 'save', params: [id: attrs.long('topicId')])}"
                out << "<a href=$subscribe class='subscribe' id=\"${id}\">Subscribe</a>"
            }

        }

    }
    def canUpdateTopic = { attrs, body ->
        Topic topic = Topic.findById(attrs.long('topicId'))
        String parent=attrs.parent
        if (session.user) {
            if (topic.createdBy.id == session.user.id || session.user.admin) {
                out << render(template: '/user/mySubscribedAndCreatedTopics', model: [topicId: topic.id,parent:parent])
            } else {
                out << render(template: '/user/mySubscribedTopics', model: [topicId: topic.id])

            }
        }
    }


    def showSeriousness = { attrs ->

        Long topicId = attrs.topicId
        User user = session.user

        if (user) {
            Topic topic= Topic.findById(topicId)
          Subscription subscription=Subscription.findByTopic(topic)
            if (subscription)
                out << g.select(class:'seriousness', topicId: topicId, name: 'seriousness', from:Seriousness.values(),
                        value: subscription.seriousness, id: topicId)
            else
                //flash.error = "User not subscribed to topic"
           out<<  "User not subscribed to topic "

        } else
            flash.error = "Either topic or user not available."

    }

    def showVisiblity = { attrs ->

        User user = session.user

        if (user) {
            Topic topic = Topic.get(attrs.topicId)
            if (topic)
                out << g.select(class: 'visibility', topicId: attrs.topicId, name: 'visiblity', from: Visiblity.values(),
                        value: topic.visiblity)
            else
                flash.error = "topic not found by given topicId"

        } else
            flash.error = "Either  user not available."

    }

    def subscriptionCount = {
        if (session.user) {
            Integer subscriptioncount = Subscription.findAllByUser(session.user).size()
            out << subscriptioncount

        }

    }

//    def subscriptionCount = { attrs ->
//        Topic topic = Topic.get(attrs.topicId)
//        Integer count = topic.subscriptions.size()
//        //        out << "<small class=\"col-xs-12\">${count}</small>"
//        out << count
//    }


    def resourceCount = { attrs ->
        if (session.user) {
            Topic topic = Topic.findById(attrs.topicId)
            Integer resourcecount = Resource.findAllByTopic(topic).size()
            out << resourcecount

        }

    }


    def topicCount = { attrs ->
        if (session.user) {
            Integer topiccount = Topic.findAllByCreatedBy(session.user).size()
            out << topiccount

        }

    }


    def caneditResources = { attrs ->
        if (session.user) {
//            out << "<a>Edit</a>"
//         out<<g.link(controller:'resource',action:'save',params: [postId:attrs.id,description:attrs.description],{"edit"} )
//        out<<
            out << "<a  href=\"javascript:void(0)\" data-toggle=\"modal\" data-target=\"#edit\">Edit</a>"
        }

    }


    def topicshow = { attrs ->
        if (session.user) {
            out << render(template: '/user/mySubscribedTopics', model: [topicId: attrs.id])
        }
    }

    def topicLinkShow = {

        if (session.user) {
            out << render(template: '/topic/topicLinkShow')
        }
    }

    def userImage = { attrs, body ->
        User user = User.findById(attrs.id)
        if (user.photo)
            out << "<img src=\"/user/image/${attrs.id}\" width=\"64\" height\"64\"/> "
        else
            out << "<img src=\"/user/image/${attrs.id}\" width=\"64\" height\"64\"/>"
    }



    def socialIcon={
        out<<""
    }
}
