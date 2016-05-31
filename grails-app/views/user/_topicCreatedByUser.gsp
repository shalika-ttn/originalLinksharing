<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">Topic</h3>
    </div>
    <g:each in="${topicList}" var="trend">

        <div class="panel-body " id="${trend.id}">
            <div>
                <div class="row">
                    <div class="list-group  col-xs-3">
                        <div class="img-thumbnail" style="float:left">
                            %{--<span class="glyphicon glyphicon-user" style="font-size:80px"></span>--}%
                            <ls:userImage id="${trend.createdBy?.id}"/>
                        </div>
                    </div>

                    <div class="col-xs-9">
                        <div class="row">

                            <g:link action="show" controller="topic" params='[topicId: "${trend.id}"]'>${trend}</g:link>
                        </div>
                        <br/><br/>

                        <div class="row">
                            <div class="col-xs-4">
                                %{--<g:link> <small class="col-xs-12">@${trend.createdBy}</small></g:link>--}%
                                <li><g:link controller="user" action="profile"
                                            params='[id:"${trend.createdBy.id}",topicId:"${trend.id}",visiblity:"${trend.visiblity}"]'>
                                    ${trend.createdBy}</g:link></li>

                                %{--<g:link name="${trend.id}" onclick="subscribe(${trend.id})"><small--}%
                                %{--class="col-xs-12">Subscribe</small></g:link>--}%
                                <ls:unSubscribed topicId="${trend.id}"/>

                            </div>

                            <div class="col-xs-4">
                                <small class="col-xs-12" style="color:#d3d3d3">Subscriptions</small>
                                <small class="col-xs-12"><g:link><ls:subscriptionCount/></g:link></small>

                            </div>

                            <div class="col-xs-4">
                                <small class="col-xs-12" style="color:#d3d3d3 ">Topics</small>
                                %{--<small class="col-xs-12">10</small>--}%
                                <small class="col-xs-12"><g:link><ls:topicCount/></g:link></small>
                            </div>
                        </div>
                    </div>
                    <ls:canUpdateTopic topicId="${trend.id}"/>
                </div>
            </div>

            <div>
            </div>
            <hr/>



        </div>
    </g:each>
</div>