%{--<div class=row>--}%
    <div class="modal fade" id="myModal2" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">create Topic</h4>
                </div>
                <div class="modal-body">

                    <g:form class="form-horizontal" controller="topic" action="save">
                        <div class="form-group">
                            <label for="name" class="control-label col-xs-2">Name</label>
                            <div class="col-xs-10">
                                <g:textField name="name" class="form-control" id="inputEmail" placeholder="name" required="required"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="visibility" class="control-label col-xs-2">visiblity</label>
                            <div class="col-xs-10">
                                %{--<g:textField name="visiblity" class="form-control" id="inputText" placeholder="topic"/>--}%

                            <g:select name="visibility" from="${com.ttnd.linksharing.Enum.Visiblity.values()}"
                                      noSelection="['': '-Select visiblity-']"/>
                        </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-10" style="float:left">
                                <g:actionSubmit value="save" action="save" class="btn btn-primary">save</g:actionSubmit>
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




%{--</div>--}%