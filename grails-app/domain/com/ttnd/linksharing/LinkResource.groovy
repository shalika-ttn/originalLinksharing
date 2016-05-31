package com.ttnd.linksharing

import groovy.transform.EqualsAndHashCode

@EqualsAndHashCode
class LinkResource extends Resource {

    String url


    static constraints = {

        url(url: true)
    }
    String toString()
    {
        "hello this is linkresource with url: $url"
    }
}
