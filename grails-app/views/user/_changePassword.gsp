<div class="panel panel-default">
    <div class="panel panel-heading">Change Password</div>

    <div class="panel-body">

        <g:uploadForm class="form-horizontal" action="updatePassword" controller="user">

            <div class="form-group">
                <label for="oldPassword" class="control-label col-xs-5">Old Password*</label>

                <div class="col-xs-7">
                    <g:passwordField name="oldPassword" type="password" class="form-control" id="password"
                                     placeholder="******"/>
                    <div class="alert-danger" role="alert">
                        <g:fieldError field="password" bean="${user}"/>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label for="password" class="control-label col-xs-5">Password*</label>


                <div class="col-xs-7">
                    <g:passwordField name="password" class="form-control" id="inputConfirm"
                                     placeholder="*****"/>
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
                <div class="col-xs-9"></div>
                 <g:hiddenField name="id" value="${id}"/>
                <div class="col-xs-3">
                    <g:actionSubmit value="update" action="updatePassword"
                                    class="btn btn-success">Update</g:actionSubmit>

                </div>
            </div>
        </g:uploadForm>

    </div>

</div>