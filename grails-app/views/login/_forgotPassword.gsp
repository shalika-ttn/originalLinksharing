<div class="container">
    <div class="row">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">
                            <h3><i class="fa fa-lock fa-4x"></i></h3>

                            <h2 class="text-center">Forgot Password?</h2>

                            <p>You can reset your password here.</p>

                            <div class="panel-body">

                                <g:form class="form" controller="user" action="forgotPassword">
                                    <fieldset>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-envelope color-blue"></i></span>

                                                %{--<input id="emailInput" placeholder="email address" class="form-control"--}%
                                                %{--oninvalid="setCustomValidity('Please enter a valid email address!')"--}%
                                                %{--onchange="try {--}%
                                                %{--setCustomValidity('')--}%
                                                %{--} catch (e) {--}%
                                                %{--}" required="" type="email">--}%

                                                <g:textField name="email" class="form-control" id="inputEmail"
                                                             placeholder="Email"/>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <g:actionSubmit value="send my password" action="forgotPassword"
                                                            class="btn btn-success">Register</g:actionSubmit>
                                            %{--<input class="btn btn-lg btn-primary btn-block" value="Send My Password"--}%
                                            %{--type="submit">--}%
                                        </div>
                                    </fieldset>
                                </g:form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>