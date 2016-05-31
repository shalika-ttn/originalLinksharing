package com.ttnd.linksharing

import com.ttnd.linksharing.CO.ResourceSearchCo
import grails.transaction.Transactional

@Transactional
class ResourceService {

    List<Resource> search(ResourceSearchCo resourceSearchCo) {
        println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${resourceSearchCo.properties}")
        Resource.resourceSearch(resourceSearchCo.getUser()).list([max: resourceSearchCo.max, offset: resourceSearchCo.offset])

    }
}

