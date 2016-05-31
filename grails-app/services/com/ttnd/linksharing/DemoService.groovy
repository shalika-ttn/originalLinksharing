 package com.ttnd.linksharing

import grails.transaction.Transactional

@Transactional (rollbackFor = Exception.class)
class DemoService {

    Integer add(Integer x,Integer y) {

      x+y
//        throw IOException()
    }


}
