# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".connect-loading-position").live "click", ->
    if confirm("Are you sure ?")
      $.ajax
        url: "/connects/new?position_id=" + $(this).data("position_id") + "&loading_id=" + $(this).data("loading_id")
        type: "GET"
        dataType: "json"
        success: (data) ->
          alert "Success"
        error: (xhr) ->
          errors = $.parseJSON(xhr.responseText).errors
          alert errors
          $("#messages").html ("<div class=\"alert alert-error\">" + errors + "</div>")