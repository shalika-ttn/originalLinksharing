<%--
  Created by IntelliJ IDEA.
  User: shalika
  Date: 6/4/16
  Time: 2:46 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>
<g:render template="checking" model="[listId:listId,listOfTopics:session.user.subscribedTopics]"/>
</body>
</html>