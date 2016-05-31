<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Users</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="panel panel-default panel-primary">
    <div class="panel-heading">
        <div class="row">
            <div class="col-md-3">
                Users
            </div>
<g:form controller="user" action="list">
    <div class="col-md-3">
        %{--  <g:select class="btn btn-default" name="active"
                      from="${com.tothenew.enums.ActiveStatus.values()}"
                      optionKey="key"/>--}%
        <select class="btn btn-default" name="active">
            <option value="null">All user</option>
            <option value="true">Active</option>
            <option value="false">In active</option>

        </select>
    </div>

    <div class="col-sm-3">
        <div id="custom-search-input" style="margin: 1px;">
            <div class="input-group col-md-12">
                <input type="text" id="topic-post-search-textbox" name="q" class="form-control input-lg"
                       placeholder="Search.."/>
                <span class="input-group-btn">
                    <button class="btn btn-info btn-lg" type="submit">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                    <button class="btn btn-info btn-lg" id="topic-post-search-clear-button" type="button">
                        <i class="glyphicon glyphicon-remove"></i>
                    </button>
                </span>
            </div>
        </div>
    </div>
</g:form>
</div>
</div>

<div class="panel-body">
    <div class="table-responsive">
        <table class="table table-condensed table-hover">
            <thead>
            <tr>
                <g:sortableColumn property="id" title="Id"/>
                <g:sortableColumn property="userName" title="User name"/>
                <g:sortableColumn property="email" title="Email"/>
                <g:sortableColumn property="firstName" title="First name"/>
                <g:sortableColumn property="lastName" title="Last name"/>
                <g:sortableColumn property="active" title="Active"/>
                <th>Manage</th>
            </tr>
            </thead>
            <g:each in="${users}" var="user">
                <g:if test="${user.active}">
                    <g:set var="bootstrapAlertClass" value="alert alert-success"/>
                </g:if>
                <g:else>
                    <g:set var="bootstrapAlertClass" value="alert alert-danger"/>
                </g:else>

                <tr class="${bootstrapAlertClass}">
                    <td>${user.id}</td>
                    <td>${user.userName}</td>
                    <td>${user.email}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.active}</td>
                    <td>
                        <g:if test="${user.active}">
                            <g:link controller="user" action="toggleActive"
                                    params='[id: "${user.id}"]'>De-activate</g:link>
                        </g:if>
                        <g:else>
                            <g:link controller="user" action="toggleActive"
                                    params='[id: "${user.id}"]'>Activate</g:link>
                        </g:else>

                    </td>
                </tr>
            </g:each>
        </table>
    </div>
</div>
</div>
</body>
</html>