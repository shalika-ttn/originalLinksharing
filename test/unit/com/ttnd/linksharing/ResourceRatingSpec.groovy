package com.ttnd.linksharing

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(ResourceRating)
class ResourceRatingSpec extends Specification {



    void "test resource rating"() {

        given:
        ResourceRating resourceRating = new ResourceRating(user: user, resource: resource, score: score)

        when:
        Boolean result = resourceRating.validate()

        then:
        result == valid

        where:
        resource           | user       | score | valid
        new LinkResource() | new User() | 2     | true
        new LinkResource() | new User() | 0     | false
        null               | new User() | 3     | false
        new LinkResource() | null       | 4     | false
        null               | null       | 0     | false
        new LinkResource() | new User() | 6     | false

    }
}
