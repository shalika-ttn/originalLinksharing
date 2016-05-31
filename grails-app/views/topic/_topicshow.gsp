<div class="panel panel-default">

    <div class="panel-heading">topic:${topics.name}


    </div>


    <div class=row style="padding:10px">

        <div class="col-xs-7">
            <div class="img-thumbnail" style="float:left">
                %{--<span class="glyphicon glyphicon-user" style="font-size:80px"></span>--}%
                <ls:userImage id="${topics.createdBy?.id}"/>

            </div>

            <div style="padding:10px">${topics.name}:${topics.visiblity}
                <br>

                <p style="color:#d3d3d3">@ ${topics.createdBy}</p>

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

                %{--<a href="#">30</a>--}%
                <g:link><ls:resourceCount topicId="${topics.id}"></ls:resourceCount></g:link>
            </div>

        </div>
    </div>

    <div class="row">
        <ls:topicshow id="${topics.id}"/>
    </div>

</div>