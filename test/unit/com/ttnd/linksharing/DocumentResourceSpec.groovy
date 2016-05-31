package com.ttnd.linksharing

import grails.test.mixin.TestFor
import spock.lang.IgnoreRest
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(DocumentResource)
class DocumentResourceSpec extends Specification {



    void "test document resource"() {
        given:
        DocumentResource doc = new DocumentResource(createdBy: user, topic: topic, description: description, filepath: f1)

        when:
        Boolean result = doc.validate()
        then:
        result == valid
        where:
        user       | topic       | description | f1                           | valid
        new User() | new Topic() | "hello"     | "file/grails/config.groovy"  | true
        new User() | new Topic() | "hello"     | "/file/grails/config.groovy" | true
        new User() | new Topic() | "hello"     | ""                           | false
        new User() | new Topic() | "hello"     | null                         | false


    }
    @IgnoreRest
    def "tostring"()
    {
        given:
        User user1 =new User()
        DocumentResource doc = new DocumentResource(createdBy: user1, topic:"grails", description:"hello", filepath:"f1/hello")
        when:
        String s=doc.toString()

        then:
        s=="this is f1/hello"
    }
}
