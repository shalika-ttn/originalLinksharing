package com.ttnd.linksharing

import grails.test.mixin.TestFor
import spock.lang.IgnoreRest
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(LoginController)
class LoginControllerSpec extends Specification {


    def "login index"() {
        when:
        controller.index()
        then:
        response.text == "failure"
    }
    //@IgnoreRest
    def "login login test"() {
        given:
//        String username
//        String password
//        and:
        User user=User.findByUserNameAndPassword("sha","abcd10")
        when:
        controller.login("sha","abcd10")
        then:
        session.user==user
//        where:
//        username|password
//        "sha"|"abcd10"

    }
    @IgnoreRest
    def "logout"()
    {
        when:
        controller.logout()
        then:
        session.invalidate()

    }

}
