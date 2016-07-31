import com.ttnd.linksharing.BootStrapService
import com.ttnd.linksharing.DocumentResource
import com.ttnd.linksharing.Enum.Seriousness
import com.ttnd.linksharing.Enum.Visiblity
import com.ttnd.linksharing.LinkResource
import com.ttnd.linksharing.ReadingItem
import com.ttnd.linksharing.Resource
import com.ttnd.linksharing.ResourceRating
import com.ttnd.linksharing.Subscription
import com.ttnd.linksharing.Topic
import com.ttnd.linksharing.User
import com.ttnd.linksharing.Constants.Constant
import grails.util.Environment


class BootStrap {
    BootStrapService bootStrapService

    def init = { servletContext ->
        println("****************************initialising Linksharing app with env: ${Environment.current.name}****************************")


        if (!isDummyDataExists())
            bootStrapService.initialize()
       println("****************************initialised Linksharing app****************************")
    }

    def destroy = {
        println("****************************destroy Linksharing app****************************")
    }

    Boolean isDummyDataExists() {
        return User.count > 1
    }

}
