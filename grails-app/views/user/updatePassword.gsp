<%--
  Created by IntelliJ IDEA.
  User: shalika
  Date: 13/3/16
  Time: 11:45 PM
--%>

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>

<p>password saved succesfully</p>


<a href="${createLink(uri: '/')}" class="btn btn-primary">
    <i class="ace-icon fa fa-tachometer"></i>
    Dashboard
</a>


${user}
</body>
</html>