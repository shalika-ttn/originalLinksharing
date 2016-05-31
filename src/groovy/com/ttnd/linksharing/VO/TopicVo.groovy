package com.ttnd.linksharing.VO

import com.ttnd.linksharing.Enum.Visiblity
import com.ttnd.linksharing.User


class TopicVo {
    Long id
    String name
    Visiblity visiblity
    Integer count
    User createdBy
    String toString()
    {
        "$name "
    }
}
