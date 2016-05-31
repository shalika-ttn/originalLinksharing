package com.ttnd.linksharing

import com.ttnd.linksharing.CO.TopicSearchCo
import grails.transaction.Transactional

@Transactional
class SubscriptionService {


    List<Topic> search(TopicSearchCo co) {


        co.getUser().getsubscribedTopics()
    }
}
