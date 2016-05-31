package com.ttnd.linksharing

import grails.transaction.Transactional

//import grails.transaction.Transactional

@Transactional
class HelloService {

    def saveUser() {

        User user = new User(firstName:"saksham", lastName: "sharma", email: "sak@gmail", password:"abcd10", userName: "saksh",
                admin:"false", active:"true ");
       if( user.save())
           println("========hiii user")
        throw RuntimeException()
        user
    }
}
