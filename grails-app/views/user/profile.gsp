<%--
  Created by IntelliJ IDEA.
  User: shalika
  Date: 11/3/16
  Time: 4:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>

<div class="col-xs-5" style="float:left">
    <div class="row">
        <g:render template="usershow"/>
    </div>

    <div class="row">

        <g:render template="profileTopic"/>
    </div>

    <div class="row">
        <g:render template="profileSubscription" model="[totalCount1:totalCount1 ]"/>
    </div>
</div>

<div class="col-xs-6" style="float:right">
    <g:render template="resourceProfile" model="[totalCount:totalCount]"/>
    %{--<g:render template="inbox" model="[readingItems: readingItems]"/>--}%
</div>

</body>
</html>