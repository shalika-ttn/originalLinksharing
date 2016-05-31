package com.ttnd.linksharing


import grails.converters.JSON

class ReadingItemsController {

    def index() { render "welcome to readingitem" }

    def changeIsRead(Long id, Boolean isRead) {

        Resource resource = Resource.findById(id)
        ReadingItem readingItem = ReadingItem.findByResource(resource)

        println("================inside chnge is read+++++++++++++++++++++++++++")
        Map result = [:]

        readingItem.isRead = isRead

        if (readingItem.save(flush: true)) {
            println("in if")
            result.message = " readingItem  updated  saved succesfully"
        } else {
            println("in else")
            result.error = "reading Item  updated not succesfully"
        }

//        if (ReadingItem.executeUpdate("update ReadingItem set isRead=${isRead} where id=${readingItem.id}")) {
//            result.message = "successfully changed isRead"
//        } else {
//            result.error = "cant changed isRead property"
//        }
        render result as JSON
    }

    def inboxUser(int inc) {
        List<ReadingItem> readingItems = ReadingItem.findAllByUser(session.user, [sort: 'dateCreated', order: 'desc', max: 10,offset:inc])
    println("--------------hello ")
//        List<ReadingItem> readingItems = ReadingItem.findAllByUser(session.user)
        render (template:"/user/inbox2" ,model:[readingItems: readingItems])
    }


}
