package com.ttnd.linksharing.CO

import grails.validation.Validateable
@Validateable
class SearchCo {

    String q
    Integer max =5
    Integer offset =0
    String order
    String sort
}



