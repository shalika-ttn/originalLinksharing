<%--
  Created by IntelliJ IDEA.
  User: shalika
  Date: 27/2/16
  Time: 5:27 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>
<g:render template="createLink" model="[listOfTopics:session.user.subscribedTopics]"/>
</body>
</html>