<!DOCTYPE html>
<html>
<head>
    <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="main">
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>

<body>
%{--<p>Error found</p>--}%
%{--<g:if env="development">--}%
%{--<g:renderException exception="${exception}"/>--}%
%{--</g:if>--}%
%{--<g:else>--}%
%{--<ul class="errors">--}%
%{--<li>An error has occurred</li>--}%
%{--</ul>--}%
%{--</g:else>--}%
<div class="error-container marginT20">
    <div class="well">
        <h1 class="grey lighter smaller">
            <span class="blue bigger-125">
                <i class="ace-icon fa fa-random"></i>
                OOPS!
            </span>
            Something Went Wrong
        </h1>

        <hr>

        <h3 class="lighter smaller">
            But we are working
            <i class="ace-icon fa fa-wrench icon-animated-wrench bigger-125"></i>
            on it!
        </h3>

        <div class="space"></div>

        <hr>

        <div class="space"></div>

        <div class="center">
            <a href="javascript:history.back()" class="btn btn-grey">
                <i class="ace-icon fa fa-arrow-left"></i>
                Go Back
            </a>

            <a href="${createLink(uri: '/')}" class="btn btn-primary">
                <i class="ace-icon fa fa-tachometer"></i>
                Dashboard
            </a>
        </div>
    </div>
</div>

</body>
</html>
