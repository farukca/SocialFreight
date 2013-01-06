# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".replytopost").click ->
    $.ajax
      url: "/posts/" + $(this).data("post-id") + "/comments/new"
      type: "GET",
      dataType: "json",
      success: (data) ->
        $(this).next(".post-comment-form").html JST["templates/comments/form"](comment : data)