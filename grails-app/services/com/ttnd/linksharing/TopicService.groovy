package com.ttnd.linksharing

import com.ttnd.linksharing.CO.TopicSearchCo
import grails.transaction.Transactional

@Transactional
class TopicService {

    def serviceMethod() {

    }

    List<Topic> search(TopicSearchCo co) {
        Topic.findAllByCreatedByAndVisiblity(co.getUser(),co.visiblity)
    }
}
