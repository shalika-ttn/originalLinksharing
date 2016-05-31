package com.ttnd.linksharing.CO

import com.ttnd.linksharing.Enum.Visiblity
import com.ttnd.linksharing.User
import grails.validation.Validateable

@Validateable
class ResourceSearchCo extends SearchCo {
    Long id
    Long topicId
    Visiblity visiblity

    User getUser() {
        User user = User.findById(id)
    }
}