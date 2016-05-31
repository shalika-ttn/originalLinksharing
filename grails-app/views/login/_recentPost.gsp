<div class="panel panel-primary">
    <div class="panel-heading">Recent Post
    </div>
    <g:each in="${resources1}" var="res">
        <div class="panel-body">
            <div class="row">
              %{--<g:include controller="user" action="image" params="[id:${session.user.id}]" />--}%
                <div class="col-xs-2" style="float: left" ><ls:userImage id="${res.createdBy?.id}"/></div>
                <div class="col-xs-10">



                    %{--<a href="#" class="inline" style="float:right">${res.topic.name}</a>--}%
                    <div class="row">
                    <br/>
                        <div class="col-xs-4">
                            ${res.createdBy}<span class="text-muted inline">@${res.createdBy}</span>
                        </div>

                        <div class="col-xs-6">
                            ${res}
                        </div>

                        <div class="col-xs-2">
                            <g:link action="show" controller="topic" params='[topicId: "${res.topic.id}"]'>${res.topic.name}</g:link>
                        </div>
                    </div>


                    <a href="#" class="share_button"><div class="fa fa-facebook-official"></div></a>
                    %{--<a href="#"><div class="fa fa-twitter inline"></div></a>--}%
                    <a href="https://twitter.com/share" class="fa fa-twitter inline" target="_target"></a>

                    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
                    %{--<a href="#"><div class="fa fa-google-plus inline"></div></a>--}%

                    <a href="https://plus.google.com/share?url={https://plus.google.com/share}" onclick="javascript:window.open(this.href,
                            '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"><img
                            src="https://www.gstatic.com/images/icons/gplus-16.png" alt="Share on Google+"/></a>


                   <div style="float: right"> <g:link  controller="resource" action="post2" params="[id:res.id]">view post</g:link>
                   </div>
                </div>

            </div>

        </div>
    </g:each>

</div>
