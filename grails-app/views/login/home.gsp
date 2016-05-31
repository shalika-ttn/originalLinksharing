<%--
  Created by IntelliJ IDEA.
  User: shalika
  Date: 26/2/16
  Time: 5:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">

</head>

<body>

<div class="container-fluid">

    <div class="col-xs-7" style="float:left">
        <div class="row">

            <g:render template="/login/recentPost"/>
        </div>

        <div class="row">
            <ls:topPost></ls:topPost>
        </div>
    </div>

    <div class="col-xs-4" style="float:right">
        <div class="row">
            %{--<div class=" panel panel-default">--}%
                %{--<g:if test="${flash.error}">--}%
                    %{--<h3>${flash.error}</h3>--}%

                %{--</g:if>--}%

                %{--<g:if test="${flash.message}">--}%
                    %{--<h3>${flash.message}</h3>--}%

                %{--</g:if>--}%
            %{--</div>--}%

            <g:render template="/login/loginform"/>
        </div>

        <div class="row">
            <g:render template="/user/createForm" model="[user: user]"/>
        </div>
    </div>
</div>

</body>
</html>