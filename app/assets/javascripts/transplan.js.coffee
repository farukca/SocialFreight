# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#reservations-table div.addIcon").click ->
    parentTR = $(this).parents().get(1)
    $.ajax
      url: "/loadings/" + $(this).data('loadid') + "/addtoplan"
      success: ->
        parentTR.toggle()
      errors: (evt, xhr, status, error) ->
	    try
	      errors = $.parseJSON(xhr.responseText)
	    catch err
	      errors = message: "Please reload the page and try again"
	    errorText = "There were errors with the submission: \n<ul>"
	    for error of errors
	      errorText += "<li>" + error + ": " + errors[error] + "</li> "
	    errorText += "</ul>"
	    $("#messages").html errorText
    return false