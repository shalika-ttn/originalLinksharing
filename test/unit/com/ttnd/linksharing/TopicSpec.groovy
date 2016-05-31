package com.ttnd.linksharing

import grails.test.mixin.TestFor
import spock.lang.IgnoreRest
import spock.lang.Specification
import com.ttnd.linksharing.Enum.Visiblity


/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Topic)
class TopicSpec extends Specification {



    //@Unroll("Executing #sno")
    void "topic validations"() {
        expect:
        Topic topic = new Topic(name: tname, createdBy: user1, visiblity: visiblity)

        when:
        Boolean result = topic.validate()

        then:
        result == valid

        where:
        tname    | user1      | visiblity         | valid
        "grails" | new User() | Visiblity.PUBLIC  | true
        "groovy" | new User() | Visiblity.PRIVATE | true
        ""       | new User() | Visiblity.PRIVATE | false
        null     | new User() | Visiblity.PRIVATE | false
        "groovy" | null       | Visiblity.PRIVATE | false

    }

//    def "should be unique per topic"() {
//        setup:
//        String tname = "grails"
//        String tname2 = "groovy"
//        User user1 =new User()
//        User user2 =new User()
//
//        Topic topic = new Topic(name: tname, createdBy: user1, visiblity:  Visiblity.PUBLIC )
//        //User user = new User(firstName: "shalika", lastName: "Kaur", userName: "sha", email: email, password: password)
//
//        when:
//        topic.save()
//
//        then:
//        Topic.count() == 1
//
//       when:
//        Topic topic2 = new Topic(name: tname, createdBy: user2, visiblity:  Visiblity.PUBLIC )
//
//        topic2.save()
//        then:
//        Topic.count() == 1
//
//        topic2.errors.allErrors.size() == 1
//        topic2.errors.getFieldErrorCount('name') == 1
//    }
    @IgnoreRest
    def "tostring"()
    {
        given:
        User user1 =new User()
        Topic topic2 = new Topic(name: "grails", createdBy: user1, visiblity:  Visiblity.PUBLIC )
        when:
        String s=topic2.toString()

        then:
        s=="This is topic grails"
    }

}
