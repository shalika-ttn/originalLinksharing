package com.ttnd.linksharing

import com.ttnd.linksharing.CO.UserCo
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.IgnoreRest
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(UserController)
@Mock([User, ReadingItem, Subscription])
class UserControllerSpec extends Specification {

    @IgnoreRest
    void "test for index"() {
        given:
        // User user = session.user
        controller.session.user = new User()
        Subscription.metaClass.static.findAllByUser = { return [new Subscription()] }
        ReadingItem.metaClass.static.findAllByUser = { user, map -> return [new ReadingItem()] }
        User.metaClass.subscribedTopics = [new Topic()]
        when:
        controller.index()
        then:
        view == "/user/dashboard"
        model.subscriptions.size() == 1
        model.readingItems.size() == 1
        model.listOfTopics.size() == 1
    }
    @IgnoreRest
    void "test for register when user is already registerd"() {
        given:
        UserCo co = new UserCo()
        controller.session.user = new User()
        when:
        controller.register(co)
        then:
        response.contentAsString == "already registered"


    }
    @IgnoreRest
    void "testing for register action for a new user"() {
        given:
        params.pic = ["hii"]
        UserCo co = new UserCo(firstName: "shalikaa", lastName: "singhall", email: "sha@gmail.com", password: "abcd123",
                userName: "shal", confirmPassword: "abcd123")
        User user = new User(firstName: co.firstName, lastName: co.lastName, email: co.email, password: co.password,
                userName: co.userName, confirmPassword: co.confirmPassword)
        user.save(flush: true)
//        controller.session.user = new User()
        when:
        controller.register(co)
        then:
        view == "/user/register"


    }


}
