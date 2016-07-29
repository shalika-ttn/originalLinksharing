package com.ttnd.linksharing

import com.ttnd.linksharing.DTO.EmailDTO
import grails.test.mixin.TestFor
import org.codehaus.groovy.grails.context.support.PluginAwareResourceBundleMessageSource
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
        def mockedMessageSource=Mock(PluginAwareResourceBundleMessageSource)
        mockedMessageSource.metaClass.getMessage={String code, Object[] args, Locale locale->
         return "This is a message"
        }
        service.messageSource=mockedMessageSource
        service.metaClass.sendMail={}

        when:
        service.sendUnreadResourcesEmail(new User(),[new LinkResource()])
        then:
        1*service.sendMail(new EmailDTO())

    }


}
