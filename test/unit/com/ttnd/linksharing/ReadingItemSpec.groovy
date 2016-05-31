package com.ttnd.linksharing

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(ReadingItem)
class ReadingItemSpec extends Specification {



    void "reading Item"() {
        given: "class Reading Item"
        ReadingItem readingItem = new ReadingItem(resource: resource, user: user, isRead: isread)

        when: "object is called to validate"
        Boolean result = readingItem.validate()

        then: "result should be equal to true"
        result == valid

        where:
        resource               | user       | isread | valid
        new DocumentResource() | new User() | true   | true
        null                   | new User() | true   | false
        new LinkResource()     | null       | true   | false
        null                   | null       | false  | false

    }
}
