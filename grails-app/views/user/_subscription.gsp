<div class="panel panel-primary" style="overflow-y: auto;height: 238px">
    <div class="panel-heading">Subscription
        <a href="#" style="float:right">View All</a>
    </div>

    <div class="panel-body">

        <g:each in="${subscriptions}" var="subscription">
            <div class="row" id="subscriptionEdit_${subscription.topic.id}" style="display: none">
                <div class="form-inline" role="form">

                    <div class="form-group">

                        <input type="text" name="topic" class="form-control col-xs-4"
                               placeholder="${subscription.topic.name}" id="subscription_${subscription.topic.id}">
                        <button name="saveTopic" class="btn changeTopicName" parent="subscription"
                                topicId="${subscription.topic.id}">save</button>
                        <button type="button" class="btn btn-default">cancel</button>

                    </div>
                </div>
            </div>

            <div class=row id="${subscription.id}">
                <div class="row">
                    <div class="col-xs-7">
                        <div class="img-thumbnail" style="float:left">
                            %{--<span class="glyphicon glyphicon-user" style="font-size:80px"></span>--}%
                            <ls:userImage id="${subscription.user?.id}"/>

                        </div>

                        <div style="padding:10px">
                            %{--<a>${subscription.topic.name}</a>--}%
                            <g:link action="show" controller="topic"
                                    params='[topicId: "${subscription.topic.id}"]'>${subscription.topic.name}</g:link>
                            <br>
                            %{--<g:link>@${subscription.user}</g:link>--}%
                            <g:link controller="user" action="profile"
                                    params='[id       : "${subscription.user.id}", topicId: "${subscription.topic.id}",
                                             visiblity: "${subscription.topic.visiblity}"]'>
                                @${subscription.user}</g:link>

                            <br/>
                            %{--<p style="color:#d3d3d3">@${subscription.user}</p>--}%
                            <g:link name="${subscription.id}"
                                    onclick="unsubscribe(${subscription.id})">Unsubscribe</g:link>

                        </div>
                    </div>

                    <div class="col-xs-5">

                        <br>

                        <div style="float:left"><p style="color:#d3d3d3">subscription <br></p>
                            %{--<a href="#">50</a>--}%

                            <g:link><ls:subscriptionCount/></g:link>

                        </div>


                        <div>
                            <p style="color:#d3d3d3">Post</p>
                            %{--<a href="#">30</a></div>--}%

                            <g:link><ls:resourceCount topicId="${subscription.topic.id}"></ls:resourceCount></g:link>
                        </div>
                    </div>
                    <br/>
                </div>

                <div>
                    %{--<div class="row">--}%
                    <ls:canUpdateTopic topicId="${subscription.topic.id}" parent="subscription"/>
                </div>
                %{--</div>--}%
            </div>

        </g:each>
    </div>
</div>