package com.ttnd.linksharing

class DemoTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]


    static namespace = "tl"

    def showAdmin={
        attrs,body ->
            Boolean admin = Boolean.valueOf(attrs.admin)
            if(admin){
                out << body()
            }
    }
}
