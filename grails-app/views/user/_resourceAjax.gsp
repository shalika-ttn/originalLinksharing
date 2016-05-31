<div class="panel-body" id="resourcechange">
    <g:each in="${resources}" var="read">

        <li class="list-group-item" style="height:110px;">

            %{--<div class="glyphicon glyphicon-user" style="font-size:70px;float:left;padding:10px"></div>--}%
            <div class="col-xs-2" style="float: left">
                ${read.topic.name}
                <br>
                %{--${read.class}--}%
            </div>

            <div>
                <a href=# style="float:right">Post</a>

                %{--<p>${read.user.firstName}  ${read.isRead}</p>--}%

                <p>${read.description}</p>
                <br/>
                <a href="#"><span class="fa fa-facebook-official"></span></a>   <a href="#"><i
                    class="fa fa-tumblr-square"></i></a>
                <a href="#"><i class="fa fa-google-plus"></i></a>

                <div style="float:right">
                    %{--<g:link controller="documentResource" action="download" params="[id:read.resource.id]">download </g:link>--}%
                    %{--<a href="#">download</a>--}%
                    %{--<a href="#">fullsize</a>--}%
                    <ls:checkResourceType resource="${read.id}"/>
                    %{--<g:if test="${read.isRead}">--}%
                    %{--<a href="#">mark as Unread</a>--}%
                    %{--</g:if>--}%
                    %{--<ls:checkIsRead isRead="${read.isRead}">--}%
                    %{--</ls:checkIsRead>--}%
                    %{--<g:link controller="user" action="post">view post</g:link>--}%

                    <g:link controller="user" action="post"
                            params="[postId: read.id]">view post</g:link>
                </p>
                </div>
            </div>
        </li>
    </g:each>
    ${totalCount}

%{--<g:paginate total="${totalCount}" controller="user" action="profile"--}%
%{--params='[id: "${co.id}", visiblity: "${co.visiblity}"]'--}%
%{--offset="${co.offset}"/>--}%

    <util:remotePaginate controller="user" action="profile" total="${totalCount}"
                         params='[id: "${co.id}", visiblity: "${co.visiblity}"]' update="resourcechange" max="5"
                         pageSizes="[5, 10]"/>
</div>

