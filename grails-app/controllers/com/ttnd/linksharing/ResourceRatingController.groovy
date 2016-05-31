package com.ttnd.linksharing

class ResourceRatingController {

    def index() { render "hiiiiiiiiiiii" }

    def save(Integer score, Integer id) {
        Resource resource = Resource.findById(id)
        User user = session.user

//        ResourceRating resourceRating = new ResourceRating(user: session.user, resource: resource, score: score)

        if (ResourceRating.executeUpdate("update ResourceRating  set score=${score} where resource.id=${id}"))
//            render "sucesssssssss ${ResourceRating.findAllByResourceAndUser(resource,user).score}"
            render(view: "save", model: [resource: resource, score: score, user: user, id: id])
        else render "failureeeeeee"

//        if (resourceRating.save(failOnError: true)) {
//            render "sucess in resource rating"
//        } else {
//            //  render "failure in resource rating"
//            render resourceRating.properties
//        }
    }
}
