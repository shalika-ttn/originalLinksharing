<div class="container">

    <div id="edit" class="modal fade">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h3 class="modal-title">Edit Description</h3>
                </div>

                <div class="modal-body">
                    <g:form controller="resource" action="save" class="form-horizontal">
                        <div class="form-group">
                            <label for="description" class="control-label col-xs-2">Description:</label>

                            <div class="col-xs-10">
                                <g:textArea name="description" class="form-control" placeholder="Description" rows="5"
                                            id="comment" value="${post.description}"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-xs-offset-2 col-xs-10" style="float:left">
                                <g:hiddenField name="postId" value="${post.id}"/>
                                <g:submitButton name="save" type="submit" value="Save"
                                                class="btn btn-primary"/>
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