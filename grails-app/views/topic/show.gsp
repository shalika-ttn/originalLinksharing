<%--
  Created by IntelliJ IDEA.
  User: shalika
  Date: 28/2/16
  Time: 11:36 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
<meta name="layout" content="main">
</head>

<body>

<div class ="col-xs-5" style="float:left">

    <g:render template="topicshow" model="${topics}"/>
    <g:render template="usershow" />



</div>

<div class ="col-xs-6" style="float:right" >


    <g:render template="posttopic" model="${posts}"/>
</div>
</body>
</html>