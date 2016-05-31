package com.ttnd.linksharing

import grails.test.mixin.TestFor
import spock.lang.IgnoreRest
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserSpec extends Specification {


//    @Unroll("Executing #sno")
    @IgnoreRest
    void "test user validations"() {
        expect:
        User user = new User(firstName: fname, lastName: lname, email: email, password: password, userName: uname,
                admin: admin, active: active);

        when:
        Boolean result = user.validate()

        then:
        result == valid

        where:
        sno | fname     | lname     | email              | password   | admin | uname   | active || valid
        1   | ""        | "hello"   | "a@b.com"          | "test123"  | false | " "     | true   || true
        2   | "shalika" | "singhal" | "shalika"          | "test123"  | false | "sha"   | false  | false
        3   | "saloni"  | "sharma"  | "saloni@gmail.com" | "te12387"  | true  | "sal30" | true   | true
        4   | "testsha" | "hello"   | "test@gmail.com"   | "test1238" | true  | "test"  | true   | true
        5   | "sha"     | "singhal" | ""                 | "abc1234"  | false | "shal"  | true   | false
        6   | "sha"     | "singhal" | null               | "abc1234"  | false | "shal"  | true   | false
        7   | "sha"     | "singhal" | "hello"            | ""         | false | "shal"  | true   | false
        8   | "sha"     | "singhal" | ""                 | null       | false | "shal"  | true   | false
        9   | "sha"     | "singhal" | ""                 | "123"      | false | "shal"  | true   | false
        10  | null      | "singhal" | ""                 | "abc1234"  | false | "shal"  | true   | false
        11  | "sha"     | ""        | "a@b.in"           | "abc1234"  | false | "shal"  | true   | false
        12  | "sha"     | "singhal" | null               | "abc1234"  | false | "shal"  | true   | false

    }

    def "get user full name"() {

        expect:
        new User(firstName: firstName, lastName: lastName).name == name

        where:
        firstName | lastName  | name
        "shalika" | "singhal" | "shalika singhal"
        ""        | "singhal" | " singhal"
//        null      | "singhal" | "singhal"
//        "saloni"  | ""        | "saloni"
//        "saloni"  | null      | "saloni"
//        null      | null      | ""
    }

    @IgnoreRest
    def "email address of user should be unique"() {
        setup:
        String email = "shalika@tothenew.com"
        String password = 'password'
        User user = new User(firstName: "shalika", lastName: "Kaur", userName: "sha", email: email, password: password)

        when:
        user.save()

        then:
        User.count() == 1

        when:
        User user2 = new User(firstName: "saloni", lastName: "Gupta", userName: "sha", email: email, password: password)
        user2.save()

        then:
        User.count() == 1
    }
    @IgnoreRest
    def "tostring"()
 {
        given:
        User user = new User(firstName: "shalika", lastName: "Kaur", userName: "sha", email:"shalika@tothenew.com", password:"password")

        when:
        String s=user.toString()

        then:
        s=="shalika "
    }
}