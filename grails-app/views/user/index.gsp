<%--
  Created by IntelliJ IDEA.
  User: shalika
  Date: 26/2/16
  Time: 6:02 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
</head>

<body>
<g:if test="${session.user}">
    </g:if>
<g:else>

<g:render template="/user/createForm"/>
</g:else>


</body>
</html>