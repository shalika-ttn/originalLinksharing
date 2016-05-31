<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">Topics</h3>
    </div>
    <g:each in="${topics}" var="trend">

        <div class="panel-body ">
            <div>
                <div class="row">
                    <div class="list-group  col-xs-3">
                        <div class="img-thumbnail" style="float:left">
                            <ls:userImage id="${session.user?.id}"/>

                        </div>
                    </div>

                    <div class="col-xs-9">
                        <div class="row">

                            <g:link action="show" controller="topic" params='[topicId: "${trend.id}"]'>${trend}</g:link>
                        </div>
                        <br/><br/>

                        <div class="row">
                            <div class="col-xs-4">
                                <small class="col-xs-12">@shalika</small>
                                <ls:unSubscribed topicId="${trend.id}"/>

                            </div>

                            <div class="col-xs-4">
                                <small class="col-xs-12" style="color:#d3d3d3">Subscriptions</small>
                                <small class="col-xs-12"><g:link><ls:subscriptionCount/></g:link></small>

                            </div>

                            <div class="col-xs-4">
                                <small class="col-xs-12" style="color:#d3d3d3 ">Topics</small>
                                <small class="col-xs-12"><g:link><ls:topicCount/></g:link></small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <hr/>

        </div>
    </g:each>

</div>