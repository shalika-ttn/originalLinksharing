package com.ttnd.linksharing.CO

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

@Validateable
class documentResourceCo {

    String contentType
    MultipartFile myFile
    String name=UUID.randomUUID()
    Integer id
    String description

    String getContentType()
    {
        myFile.contentType
    }
}
