<div class=row>
    <div class="panel panel-default">
        <div class="panel-heading">post</div>

        <g:form controller="resourceRating" action="save" params="[id: post.id]">
            <div class="panel-body">

                <li class="list-group-item" style="height:130px;">
                    <div class="col-xs-2" style="float: left"><ls:userImage id="${post.createdBy?.id}"/></div>

                    <div>
                        <g:link style="float: right" action="show" controller="topic"
                                params='[topicId: "$post.topic.id}"]'>${post.topic.name}</g:link>


                        <p>${post.createdBy}</p>

                        <p>${post.description}</p>

                        <g:if test="${session.user}">
                            <div style="float: left">

                                <g:select name="score" from="${[1, 2, 3, 4, 5]}"
                                          noSelection="['': '-Select vote-']"/>

                            </div>

                            <div>
                                <g:actionSubmit value="Vote" controller="ResourceRating" action="save"
                                                class="btn ">Vote</g:actionSubmit>
                            </div>
                        </g:if>

                        <a href="#"><span class="fa fa-facebook-official"></span></a>   <a href="#"><i
                            class="fa fa-tumblr-square"></i></a>
                        <a href="#"><i class="fa fa-google-plus"></i></a>

                        <div style="float:right">

                            <ls:canDeleteResources resourceId="${post.id}"/>
                            %{--<a href="#">edit</a>--}%

                            <ls:caneditResources id="${post.id}" description="${post.description}"/>

                            <ls:checkResourceType resource="${post.id}"/>
                        </p>
                        </div>
                    </div>
                </li>

            </div>
        </g:form>
        <g:render template="/user/editResource" model="[post: post]"></g:render>
    </div>

</div>