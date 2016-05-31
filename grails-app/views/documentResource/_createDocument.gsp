<div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Share Document</h4>
            </div>

            <div class="modal-body">
                <g:uploadForm  class="form-horizontal" controller="documentResource" action="saveDoc" method="post">
                    <div class="form-group">
                        <label  class="control-label col-xs-2">Document</label>
                        <input type="file" name="myFile"/>
                        %{--<div class="col-xs-10">--}%
                        %{--<g:textField name="filepath" class="form-control" id="inputText" placeholder="Document"/>--}%
                        %{--</div>--}%

                    </div>


                    <div class="form-group">
                        <label for="description" class="control-label col-xs-2">Description</label>

                        <div class="col-xs-10" style="width:200px ; height:100px">
                            <g:textArea rows="4" cols="40" name="description"></g:textArea>

                        </div>
                    </div>

                    <div class="form-group">
                        <label for="id" class="control-label col-xs-2">Topic</label>
                        %{--<div class="col-xs-10">--}%
                        %{--<g:textField name="name" class="form-control" id="topic" placeholder="topic name"/>--}%
                        %{--</div>--}%
                        <g:select name="id" from="${listOfTopics}" optionKey="id"
                                  noSelection="['': '-Select topic-']"/>

                    </div>

                    <div class="form-group">
                        <div class="col-xs-offset-2 col-xs-10" style="float:left">
                            <g:actionSubmit value="submit" action="saveDoc"
                                            class="btn btn-primary">share</g:actionSubmit>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-offset-5 col-xs-10" style="float:right">
                            <button type="submit" class="btn btn-primary">cancel</button>
                        </div>

                    </div>
                </g:uploadForm>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

