package com.ttnd.linksharing



class UnreadItemEmailJob {
    def userService
    static triggers = {
//      simple repeatInterval: 5000l // execute job once in 5 seconds



        cron cronExpression: "0 0 1 ? * MON *"
    }

    def execute() {
        userService.sendUnreadItemsEmail()
    }
}
