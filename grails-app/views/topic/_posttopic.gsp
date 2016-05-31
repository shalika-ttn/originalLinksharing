<div class=row>
    <div class="panel panel-default">
        <div class="panel-heading">Post:${topics.name}

            <div class="input-group">
                <span class="input-group-btn">
                    <button  id="findSearchPostBox" topicId="${topics.id}"
                            class="btn btn-primary glyphicon glyphicon-search searchButtons findSearchPostBox">
                    </button></span> <input type="text" id="searchPostBox" class="form-control input-group searchPostBox"
                                            placeholder="Search">
                <span class="input-group-btn">
                    <button id="clearSearchPostBox"
                            class="btn btn-primary glyphicon-searchphicon glyphicon-remove searchButtons">
                    </button></span></div>

        </div>
        <div id="topicPosts" class="panel-body">
            <g:render template="/topic/resourceSearch" model="[posts: posts]"/>

        </div>
    </div>
</div>