<div class=row>
    <div class="modal fade" id="myModal1" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Send Invitaion</h4>
                </div>

                <div class="modal-body">

                    <g:form class="form-horizontal" controller="topic" action="invite">
                        <div class="form-group">
                            <label for="email" class="control-label col-xs-2">Email</label>

                            <div class="col-xs-10">
                                <g:textField name="email" class="form-control" id="inputEmail" placeholder="Email"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="id" class="control-label col-xs-2">Topic</label>

                            <div class="col-xs-10">
                                %{--<g:textField name="name" class="form-control" id="inputText" placeholder="topic"/>--}%

                                <g:select name="id" from="${listOfTopics}" optionKey="id"
                                          noSelection="['': '-Select topic-']"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-10" style="float:left">
                                <g:actionSubmit value="invite" action="invite"
                                                class="btn btn-primary">invite</g:actionSubmit>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-offset-5 col-xs-10" style="float:right">
                                <button type="submit" class="btn btn-primary">cancel</button>
                            </div>

                        </div>
                    </g:form>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

</div>