<div class=row>
    <div class="panel panel-default">
        <div class="panel-heading">Post:${topics.name}</div>

<div id="topicPosts" class="panel-body">
    <g:each in="${posts}" var="post">
        <div class="row">
            <div class=" col-xs-2" style="font-size:70px; float:left">
                <ls:userImage id="${post.createdBy?.id}"/>
            </div>

            <div class="col-xs-10">
                ${post.createdBy}<span class="text-muted inline">@${post.createdBy}</span>
                <a href="#" class="inline" style="float:right">${post.topic.name}</a>

                <p>${post.description}
                </p>
                <a href="#"><div class="fa fa-facebook-official"></div></a>
                <a href="#"><div class="fa fa-twitter inline"></div></a>
                <a href="#"><div class="fa fa-google-plus inline"></div></a>


                <a href="#" class="inline" style="float:right;padding: 2px"><u>Download</u></a>
                <a href="#" class="inline" style="float:right;padding: 2px"><u>Full site</u></a>

            </div>

        </div>
        <hr/>
    </g:each>

</div>
</div>
</div>