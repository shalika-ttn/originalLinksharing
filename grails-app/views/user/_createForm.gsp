<head>
    <style>
    .error {
        color: #ff0000;
    }
    </style>
</head>

<div class="panel panel-primary">
    <div class="panel panel-heading">Register</div>

    <div class="panel-body">

        <g:uploadForm class="form-horizontal" name="registerForm" id="registerForm" action="register" controller="user">
            <div class="form-group">
                <label for="firstName" class="control-label col-xs-5">First Name*</label>

                <div class="col-xs-7">
                    <g:textField name="firstName" class="form-control" id="inputFname" value="${user?.firstName}"
                                 placeholder="firstName"/>
                    <div class="alert-danger" role="alert">
                        <g:fieldError field="firstName" bean="${user}"/>
                    </div>

                </div>
            </div>

            <div class="form-group">
                <label for="lastName" class="control-label col-xs-5">Last Name*</label>

                <div class="col-xs-7">
                    <g:textField name="lastName" class="form-control" id="lastName" value="${user?.lastName}"
                                 placeholder="lastName"/>
                    <div class="alert-danger" role="alert">
                        <g:fieldError field="lastName" bean="${user}"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="email" class="control-label col-xs-5">Email*</label>

                <div class="col-xs-7">
                    <g:textField name="email" class="form-control" id="inputEmail" value="${user?.email}"
                                 placeholder="Email"/>
                    <div class="alert-danger" role="alert">
                        <g:fieldError field="email" bean="${user}"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="userName" class="control-label col-xs-5">Username*</label>

                <div class="col-xs-7">
                    <g:textField name="userName" class="form-control" id="userName" value="${user?.userName}"
                                 placeholder="userName"/>
                    <div class="alert-danger" role="alert">
                        <g:fieldError field="userName" bean="${user}"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="password" class="control-label col-xs-5">Password*</label>

                <div class="col-xs-7">
                    <g:passwordField name="password" type="password" class="form-control" id="password"
                                     placeholder="******"/>
                    <div class="alert-danger" role="alert">
                        <g:fieldError field="password" bean="${user}"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="confirmPassword" class="control-label col-xs-5">Confirm Password*</label>


                <div class="col-xs-7">
                    <g:passwordField name="confirmPassword" class="form-control" id="inputConfirm"
                                     placeholder="*****"/>
                    <div class="alert-danger" role="alert">
                        <g:fieldError field="confirmPassword" bean="${user}"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-xs-5">photo*</label>

                <div class="col-xs-7">
                    <input type="file" id="pic" name="pic"/>
                </div>

            </div>

            <div class="form-group">
                <div class="col-xs-9"></div>

                <div class="col-xs-3">
                    <g:actionSubmit value="register" class="btn btn-success">Register</g:actionSubmit>

                </div>
            </div>
        </g:uploadForm>
    </div>
</div>




