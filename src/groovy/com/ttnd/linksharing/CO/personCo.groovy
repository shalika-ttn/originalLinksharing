package com.ttnd.linksharing.CO

import grails.validation.Validateable

@Validateable

class personCo {


    Integer salary
    String  frndname

    static  constraints=
    {
        salary nullable: false
        frndname nullable: false
    }


}



