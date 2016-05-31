package com.ttnd.linksharing

import com.ttnd.linksharing.Enum.Seriousness
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
class SubscriptionSpec extends Specification {



    @Unroll("Test subscription for #description")
    void "test subscription"() {

        expect:
        Subscription subscription = new Subscription(user: user, topic: topic, seriousness: seriousness)


        when:
        Boolean result = subscription.validate()
        then:
        result == isValid
        where:
        description        | user       | topic       | seriousness         || isValid
        "All valid fields" | new User() | new Topic() | Seriousness.SERIOUS || true
        "Null topic"       | new User() | null        | Seriousness.SERIOUS || false
        "Null user"        | null       | null        | Seriousness.SERIOUS || false


    }
}
