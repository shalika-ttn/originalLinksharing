<g:each in="${subscriptions}" var="trend">

    <div class="panel-body " id="subscriptionchange">
        <div>
            <div class="row">
                <div class="list-group  col-xs-3">

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
                %{--<ls:canUpdateTopic topicId="${trend.id}"/>--}%
            </div>
        </div>

        <hr/>

    </div>
</g:each>
<util:remotePaginate controller="user" action="profile2" total="${totalCount1}"
                     params='[id: "${co.id}", visiblity: "${co.visiblity}"]' update="resourcechange" max="5"
                     pageSizes="[5, 10]"/>


