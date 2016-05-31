<div class=row>
    <div class="panel panel-primary">
        <div class="panel panel-heading">Login</div>

        <div class="panel-body">
            %{--<div class=" panel panel-default" >--}%
                %{--<g:if test="${flash.error}">--}%
                    %{--<h3>${flash.error}</h3>--}%

                %{--</g:if>--}%
            %{--</div>--}%

                   <g:form class="form-horizontal">
                <div class="form-group" style="padding:10px">
                    <label for="name" class="control-label col-xs-4">Username</label>

                    <div class="col-xs-8">
                        <g:textField name="userName" class="form-control" id="name" placeholder="Enter name"/>
                    </div>
                </div>

                <div class="form-group" style="padding:10px">
                    <label for="password" class="control-label col-xs-4">Password</label>

                    <div class="col-xs-8">
                        <g:passwordField name="password" class="form-control" id="password" placeholder="password"/>
                    </div>
                </div>

                <div class="form-group">
                    %{--<label  class="col-xs-4" style="padding:10px"><a>Forgot Password</a></label>--}%
                    <g:link action="forgotPassword" controller="login">Forgot Password</g:link>
                    <div class="col-xs-8">
                        <g:actionSubmit value="login" action="login" controller="login"
                                        class="btn btn-primary">Login</g:actionSubmit>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>
