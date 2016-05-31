<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">Top Posts</h3></div>

    <div class="panel-body">
        <g:each in="${resources}" var="res"><br>

            <div class="row">
                <div class="col-xs-4">
                    <div class="img-thumbnail">
                        <ls:userImage id="${res.createdBy?.id}"/>
                    </div>
                </div>


                <div class="col-xs-4">
                    ${res.createdBy}<span class="text-muted inline">@${res.createdBy}</span>


                    <p>${res.description}</p>
                    %{--<g:paginate  maxsteps="1" total="${resourceCount}" controller="login" action="topPost"/>--}%

                    %{--<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta                 felis--}%
                    %{--</p>--}%
                    <a href="#"><div class="fa fa-facebook-official"></div></a>
                    <a href="#"><div class="fa fa-twitter inline"></div></a>
                    <a href="#"><div class="fa fa-google-plus inline"></div></a>
                </div>

                <div class="col-xs-3" style="float: right">
                    <div class="row">
                        <g:link action="show" controller="topic" params='[topicId: "${res.topic.id}"]'>${res.topic.name}</g:link>

                        %{--<a href="#" class="inline" style="float:right">${res.topic}</a>--}%
                    </div>

                    <div class="row"><br/> <br/></div>

                    <div class="row">

                        %{--<a href="#" class="inline" style="float:right"><u>View Post</u></a>--}%
                        <g:link  controller="resource" action="post2" params="[id:res.id]">view post</g:link>
                    </div>
                </div>
            </div>


        </g:each>
    </div>

</div>
