package com.ttnd.linksharing.CO

import com.ttnd.linksharing.Enum.Visiblity
import com.ttnd.linksharing.User

class TopicSearchCo extends  SearchCo{

    Long id
    Visiblity visiblity

    User getUser() {
        User user = User.findById(id)
    }
}

