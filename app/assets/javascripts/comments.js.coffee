# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(document).on "click", ".replytopost", (ev) ->
    ev.preventDefault()
    postElement = $(this)
    commentForm = "Post_" + postElement.data("post-id") + "_commentform"
    $.ajax
      url: "/posts/" + postElement.data("post-id") + "/comments/new"
      type: "GET",
      dataType: "json",
      success: (data) ->
        document.getElementById(commentForm).innerHTML= JST["templates/comments/form"](comment : data)