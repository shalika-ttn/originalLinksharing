package com.ttnd.linksharing

import com.ttnd.linksharing.DTO.EmailDTO
import grails.test.mixin.TestFor
import org.codehaus.groovy.tools.shell.util.MessageSource
import spock.lang.Specification

import javax.validation.constraints.Null


/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(EmailService)
class EmailServiceSpec extends Specification {


    def "send Unread Items mail To user"()
    {
        given:
        def mockedMessageSource=Mock(MessageSource)
        service.messageSource=mockedMessageSource

        when:
       EmailDTO emailDTO= service.sendUnreadResourcesEmail(new User(),[new LinkResource()])
        then:
        emailDTO!=Null

    }

}
