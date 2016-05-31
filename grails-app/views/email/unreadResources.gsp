<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div class="panel panel-default panel-primary">
    <div class="panel-heading">
        <div class="row">
            <div class="col-md-3">
                ${user} your unread Items
            </div>
        </div>
    </div>

    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-condensed table-hover">
                <thead>
                <tr>
                    <th>Topic</th>
                    <th>Resource</th>
                    <th>Description</th>
                </tr>
                </thead>
                <g:each in="${unreadResource}" var="resource">
                    <tr>
                        <td>${resource.topic}</td>
                        <td>${resource}</td>
                        <td>${resource.description}</td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</div>

</body>
</html>