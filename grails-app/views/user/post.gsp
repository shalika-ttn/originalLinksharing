<%--
  Created by IntelliJ IDEA.
  User: shalika
  Date: 3/3/16
  Time: 3:54 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>
<div class="container-fluid">

    <div class="col-xs-6" style="float:left">
        <div class="row">
            <g:render template="/user/resource" model="[post:post]"/>
        </div>
    </div>

    <div class="col-xs-5" style="float:right">
        <div class="row">
            <ls:trendingTopics/>
        </div>
    </div>
</div>

</body>
</html>