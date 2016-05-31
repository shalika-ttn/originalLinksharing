<div class="modal fade" id="myModal4" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Share Link</h4>
            </div>
            <div class="modal-body">

                <g:form class="form-horizontal" controller="linkResource" action="saveLink">
                    <div class="form-group">
                        <label for="url" class="control-label col-xs-2">Link</label>
                        <div class="col-xs-10">
                            <g:textField name="url" class="form-control" id="inputText" placeholder="URL"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputText" class="control-label col-xs-2">Description</label>
                        <div class="col-xs-10" style="width:200px ; height:100px">
                            <g:textArea rows="4" cols="40" name="description" ></g:textArea>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputText" class="control-label col-xs-2">Topic</label>
                        <div class="col-xs-10">

                            <g:select name="name" from="${listOfTopics}" optionKey="id"
                                      noSelection="['': '-Select topic-']"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-offset-2 col-xs-10" style="float:left">
                            <g:actionSubmit value="share" action="saveLink" class="btn btn-primary">share</g:actionSubmit>
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