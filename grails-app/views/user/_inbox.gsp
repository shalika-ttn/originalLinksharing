<div class=row>
    <div class="panel panel-primary inboxUser" style="overflow-y: auto;height: 590px" onscroll="myFunction()" id="su">
        <div class="panel-heading">Inbox
        </div>

        <div class="panel-body inboxBody">
            %{--<g:each in="${readingItems}" var="read">--}%

                %{--<li class="list-group-item" style="height:110px;">--}%

                    %{--<div class="glyphicon glyphicon-user" style="font-size:70px;float:left;padding:10px"></div>--}%
                    %{--<div class="col-xs-2" style="float: left"><ls:userImage id="${read.resource.createdBy?.id}"/></div>--}%

                    %{--<div>--}%
                        %{--<g:link style="float: right" action="show" controller="topic"--}%
                                %{--params='[topicId: "${read.resource.topic.id}"]'>${read.resource.topic.name}</g:link>--}%

                        %{--<p>${read.user.firstName}  ${read.isRead}</p>--}%

                        %{--<p>${read.resource.description}</p>--}%
                        %{--<a href="#"><span class="fa fa-facebook-official"></span></a>   <a href="#"><i--}%
                            %{--class="fa fa-tumblr-square"></i></a>--}%
                        %{--<a href="#"><i class="fa fa-google-plus"></i></a>--}%

                        %{--<div style="float:right">--}%
                            %{--<ls:checkResourceType resource="${read.resource.id}"/>--}%

                            %{--<ls:checkIsRead resourceId="${read.resource.id}" isRead="${read.isRead}">--}%
                            %{--</ls:checkIsRead>--}%
                            %{--<g:link controller="user" action="post"--}%
                                    %{--params="[postId: read.resource?.id]">view post</g:link>--}%

                        %{--</p>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</li>--}%
            %{--</g:each>--}%
            <g:render template="/user/inbox2" model="[readingItems:readingItems]"/>

        </div>
    </div>
</div>