<%--
  Created by IntelliJ IDEA.
  User: shalika
  Date: 20/3/16
  Time: 9:18 PM
--%>

<%@ page import="com.ttnd.linksharing.ResourceRating" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>
<p> sucessfully changed score to ${com.ttnd.linksharing.ResourceRating.findAllByResourceAndUser(resource,user).score}</p>

<a href="${createLink(controller: 'user',action: 'post',params:[postId:id] )}" class="btn btn-primary">
    <i class="ace-icon fa fa-tachometer"></i>
    go back
</a>
</div>

</body>
</html>