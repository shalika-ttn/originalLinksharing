// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self
//= require bootstrap
//=require font-awesome


if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
            $(this).fadeOut();
        });
    })(jQuery);
}

function success(data, id) {
    $("#alert").html(data.message);


    var messageAlert = $(".messageAlert");
    for (item in data) {
        if (item === "message") {
            messageAlert.text(data[item]);
            messageAlert.addClass("alert-success");
            $("#" + id).remove();
            messageAlert.css({'display': 'block'});
        }
        else {
            messageAlert.text(data[item]);
            messageAlert.addClass("alert-danger");
            messageAlert.css({'display': 'block'});
        }
    }
}

function subscriptionsuccess(data) {
    //alert("hello222")
    var messageAlert = $(".messageAlert");
    //alert(data.message)
    for (item in data) {
        if (item === "message") {
            //alert("helloc");
            //alert("inside if");
            messageAlert.text(data[item]);
            messageAlert.addClass("alert-success");
            messageAlert.css({'display': 'block'});
        }
        else {
            //alert("helloc")

            messageAlert.text(data[item]);
            messageAlert.addClass("alert-danger");
            messageAlert.css({'display': 'block'});
        }
    }
}

function toggle(id) {

}

function unsubscribe(id) {
    event.preventDefault();
    $.ajax({
        url: '/subscription/delete',
        data: {id: id},
        method: 'post',
        success: function (data) {
            success(data, id)
        },
        error: function (data) {
            alert(data.error)
        }
    })
}
var inc = 0;
function myFunction() {
    var inboxUser=$(".inboxUser");
    var y =inboxUser.scrollTop();
    if ((y + 15) >= inboxUser.height()) {
        inc = inc + 10;
        console.log(inc);
        $.ajax({
            url: '/readingItems/inboxUser',
            data: {off: inc},
            success: function (data) {
                $(".inboxBody").append(data);
                //alert("sucesfull")
            },
            error: function (data) {
                alert("some error occured" + data)
            }

        });
    }
}
function deleteTopic(id) {
    event.preventDefault();

    if (confirm("Do you want Topic to get delete") == true) {
        $.ajax({

            url: '/topic/delete',
            data: {id: id},
            method: 'post',
            success: subscriptionsuccess,
            error: function () {
                alert("some error occured")
            }
        });
    }

}

function markread(id, isRead) {
    event.preventDefault();
    //alert("mark as read");
    //var self =  $(this).attr('name');
    //$("#id_n")

    $.ajax({

        url: '/readingItems/changeIsRead',
        data: {id: id, isRead: isRead},
        method: 'post',
        success: function (data) {
            console.log("Try");
            console.log(jQuery(self));
            var messageAlert = $(".messageAlert");

            //alert(data.message)
            for (item in data) {
                if (item === "message") {
                    //if(isRead==true)
                    //{}
                    if (isRead) {
                        jQuery("." + id + "").text("Mark as Read");
                        //event.preventDefault();
                        messageAlert.text(data[item]);
                        messageAlert.addClass("alert-success");
                        messageAlert.css({'display': 'block'});

                    }
                    else {
                        jQuery("." + id + "").text("Mark as UnRead");
                        //event.preventDefault();
                        messageAlert.text(data[item]);
                        messageAlert.addClass("alert-success");
                        messageAlert.css({'display': 'block'});


                    }
                    //$(self).text("Mark as read");
                    //jQuery(self).val("Mark as Read");
                    //console.log("."+id + "");
                    //console.log(jQuery("."+id + ""));
                    //console.log(jQuery("." + id).prop('href'));
                    //console.log(jQuery("." + id).attr('href'));

                }
                else {
                    console.log("." + id + "");
                    console.log(jQuery("." + id + ""));
                    // jQuery("." + id).text("Mark as read");
                    messageAlert.text(data[item]);
                    messageAlert.addClass("alert-danger");
                    messageAlert.css({'display': 'block'});
                }
            }
        },
        error: function () {
            alert("some error occured")
        }
    });

}

$(document).ready(function () {


    $('.share_button').click(function (e) {
        e.preventDefault();
        FB.ui(
            {
                method: 'feed',
                name: 'This is the content of the "name" field.',
                link: ' http://www.hyperarts.com/',
                //link: 'http://localhost:8080/',

                //picture: 'http://www.hyperarts.com/external-xfbml/share-image.gif',
                caption: 'This is the content of the "caption" field.',
                description: 'This is the content of the "description" field, below the caption.',
                message: ''
            });
    });

    $(".seriousness").change(function () {
        console.log("............." + $(this).attr('topicId') + "---------" + $(this).val());
        $.ajax({
            url: "/subscription/update",
            data: {id: $(this).attr('topicId'), seriousness: $(this).val()},
            success: subscriptionsuccess,
            error: function () {
                alert("some error occured")
            }


        });
    });


    $(".visibility").change(function () {
        console.log("............." + $(this).attr('topicId') + "---------" + $(this).val());
        $.ajax({
            url: "/topic/update",
            data: {id: $(this).attr('topicId'), visiblity: $(this).val()},
            success: subscriptionsuccess

        });
    });

    $(".subscribe").click(function (event) {
        //alert("hello");

        event.preventDefault();
        $.ajax({
            url: '/subscription/save',
            data: {id: $(this).attr('id')},
            method: 'post',
            success: subscriptionsuccess,
            error: function () {
                alert("some error occured")
            }
        });
    });


    $("#clearSearchPostBox").click(function () {
        $("#searchPostBox").val("")
    });

    $(".findSearchPostBox").click(function () {
        topicId = $(this).attr('topicId');

        $.ajax({
            url: "/resource/search",
            data: {q: $(this).parent().parent().find($('.searchPostBox')).val(), topicId: topicId},
            method: 'post',
            type: 'html',
            success: function (result) {
                //alert(result)
                $("#topicPosts").html(result)
            }
        });
    });


    $(".edit").bind('click', function () {
        var topicId = $(this).attr("topicId");
        var parent = $(this).attr("parent");
        event.preventDefault();
        var editRow = $("#" + parent + "Edit_" + topicId);
        editRow.show();
        event.preventDefault()
    });


    $(".changeTopicName").bind('click', function () {
        //alert("hello")
        var topicId = $(this).attr("topicId");
        var parent = $(this).attr("parent");
        var topicName = $("#" + parent + "_" + topicId).val();
        var visibility = "public";
        //alert(topicName+"---" + topicId + parent);
        $.ajax({
            url: "/topic/topicUpdate",
            data: {topicName: topicName, topicId: topicId},
            success: function (data) {
                if (data.message) {
                    $(".topicName_" + topicId).html(data.topicName);
                    $("#" + parent + "Edit_" + topicId).hide();
                    subscriptionsuccess(data);
                    //subscriptionsuccess({message: "Updated topic"});
                } else {
                    subscriptionsuccess(data);
                    //subscriptionsuccess({error: data.message})
                }
            },
            error:function () {
                alert("some error occured")
            }
        });


    });


    //$(".inboxUser").scroll(function()
    //{
    //    $.ajax({
    //        url: '/readingItems/inboxUser',
    //        //data: {id: $(this).attr('id')},
    //        //data:{readingItems,}
    //
    //    });
    //
    //});


});


//
//$(function () {

$('#registerForm').validate({
    rules: {
        'firstName': {
            required: true
        },
        'lastName': {
            required: true
        },
        'password': {
            required: true,
            minlength: 5
        },
        'confirmPassword': {
            required: true,
            confirm: true
        },
        'userName': {
            required: true,
            remote: {
                url: "/login/validateUserName",
                type: "post"
            }
        },
        'email': {
            required: true,
            email: true,
            remote: {
                url: "/login/validateEmail",
                type: "post"
            }
        }
    },
    submitHandler: function (form) {
        form.submit();
    },
    messages: {
        'firstName': {
            required: "firstName is a required Field"
        },
        'lastName': {
            required: "please provide a LastName "
        }
    }

});

jQuery.validator.addMethod("confirm", function (value, element) {
    var result = false;
    var password = $('#registerForm input[id=password]').val();

    if (password === value) {
        result = true;
    }
    return result;
}, "Confirm password not matched with password");



