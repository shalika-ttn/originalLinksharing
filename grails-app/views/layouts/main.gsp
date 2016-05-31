<%@ page import="com.ttnd.linksharing.Enum.Visiblity" %>
<!DOCTYPE HTML>
<html lang="en">

<head>
    <title>first bootstrap program>
    <g:layoutTitle default="Grails"/>
    </title>
    <meta property="og:url"           content="http://localhost:8080/" />
    <meta property="og:type"          content="website" />
    <meta property="og:title"         content="LinkSharing" />
    <meta property="og:description"   content="Your description" />
    %{--<meta property="og:image"         content="http://www.your-domain.com/path/image.jpg" />--}%
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    %{--<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>--}%
    <style>
    input {
        text-align: center;
    }
    </style>
    <g:layoutHead/>
</head>

<body>
<script>
    window.fbAsyncInit = function() {
        FB.init({
            appId      : '880681558707028',
            xfbml      : true,
            version    : 'v2.5'
        });
    };

    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<g:if test="${session.user}">
    <div class="container-fluid">

        <div class="navbar navbar-default">
            <div class="navbar-header">
                <div class="col-xs-12">
    <g:link action="index" controller="user"><h2>Link Sharing</h2></g:link>
    </div>
</div>

<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="margin:10px">
    <div class="navbar-form  navbar-right" role="search">

%{--<input type="text" placeholder="Search"><span class="glyphicon glyphicon-search"--}%
%{--style="margin-left:-161px">--}%
%{--<form class="navbar-form navbar-right" style="padding-right:30px">--}%

    <div class="input-group" style="padding-right:30px">
        <span class="input-group-btn">
            <button id="findSearchPostBox" topicId="${0}"
                    class="btn btn-primary glyphicon glyphicon-search searchButtons findSearchPostBox">
            </button></span> <input type="text" id="searchPostBox" class="form-control input-group searchPostBox"
                                    placeholder="Search">
        <span class="input-group-btn">
            <button id="clearSearchPostBox"
                    class="btn btn-primary glyphicon-searchphicon glyphicon-remove searchButtons">
            </button></span></div>
%{--</form>--}%



    </span>
    </input>

    <ul class="nav navbar-nav navbar-right">
        <li>
            <!--<div class="col-xs-7" style="float:right" >-->
            <button type="button" data-toggle="modal" data-target="#myModal2">
                <span class="glyphicon glyphicon-cloud" style="font-size:20px"></span>
            </button>
        </li>
        <li>
            <button type="button" data-toggle="modal" data-target="#myModal1">
                <span class="glyphicon glyphicon-envelope" style="font-size:20px"></span>
            </button>
        </li>
        <li>
            <button type="button" data-toggle="modal" data-target="#myModal3">
                <span class="glyphicon glyphicon-paperclip" style="font-size:20px"></span>
            </button>
        </li>
        <li>
            <button type="button" data-toggle="modal" data-target="#myModal4">
                <span class="glyphicon glyphicon-file" style="font-size:20px"></span>
            </button>
        </li>
        %{--<li>--}%
            %{--<button type="button" data-toggle="modal" data-target="#myModal5">--}%
                %{--<span class="glyphicon glyphicon-paperclip" style="font-size:20px"></span>--}%
            %{--</button>--}%
        %{--</li>--}%

        <span class="glyphicon glyphicon-user" style="font-size:23px"></span>

        <div class="dropdown" style="float:right">
            <button class="btn" data-toggle="dropdown">${session.user.firstName}<span class="caret"
                                                                                      style="font-size:20px">
            </span></button>
            <ul class="dropdown-menu">
                <li><g:link controller="user" action="privateProfile"
                            params="[id: session.user.id]">profile</g:link></li>
                %{--<li><a href="#">user</a></li>--}%
                <li><g:link controller="user" action="list">user</g:link></li>
                <g:link action="logout" controller="login">Logout</g:link>
            </ul>
        </div>
    </ul>
    </li>

    </ul>
    </form>
    </div>
    </nav>
    </div>
    <g:render template="/topic/createTopic"/>
    <g:render template="/topic/sendInvitation" model="[listOfTopics: session.user.subscribedTopics]"/>
    <g:render template="/documentResource/createDocument"/>
    <g:render template="/linkResource/createLink"/>
    <g:render template="/documentResource/multiList"/>

    </div>
</g:if>
<g:else>
    <div class="container-fluid">
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <div class="col-xs-12">
                    <g:link action="index" controller="login"><h2>Link Sharing</h2></g:link>
                </div>
            </div>

            %{--<form class="navbar-form navbar-right" style="padding-right:30px" role="search">--}%

            %{--<input type="text" placeholder="Search"><span class="glyphicon glyphicon-search"--}%
            %{--style="margin-left:-161px">--}%
            %{--</span>--}%

            %{--</form>--}%

            %{--<form class="navbar-form navbar-right" style="padding-right:30px">--}%

            %{--<div class="input-group" style="padding-right:30px">--}%
            %{--<span class="input-group-btn">--}%
            %{--<button id="findSearchPostBox"--}%
            %{--class="btn btn-primary glyphicon glyphicon-search searchButtons">--}%
            %{--</button></span> <input type="text" id="searchPostBox" class="form-control input-group"--}%
            %{--placeholder="Search">--}%
            %{--<span class="input-group-btn">--}%
            %{--<button id="clearSearchPostBox"--}%
            %{--class="btn btn-primary glyphicon-searchphicon glyphicon-remove searchButtons">--}%
            %{--</button></span></div>--}%
            %{--</form>--}%
        </nav>
    </div>

</g:else>

%{--<div class="alert messageAlert" id="alert" style="display:none">--}%

%{--</div>--}%
<div class="container">
    <div class="alert messageAlert" id="alert" style="display:none">
    </div>

    <div class="row">
        <g:if test="${flash.message}">

            <div class="col-xs-12 alert alert-success">
                <button type="button" class="close" data-dismiss="alert">×</button>
                <label><%=flash.message%></label>
            </div>
        </g:if>
    </div>

    <div class="row">
        <g:if test="${flash.error}">
            <div class="col-xs-12 alert alert-danger">
                <button type="button" class="close" data-dismiss="alert">×</button>
                <label><%=flash.error%></label>
            </div>
        </g:if>
    </div>

</div>
<g:layoutBody/>

<asset:javascript src="application.js"/>
<asset:stylesheet href="application.css"/>
<asset:javascript src="jquery-2.2.1.min.js"/>
<asset:javascript src="jquery.validate.min.js"/>

</body>
</html>

