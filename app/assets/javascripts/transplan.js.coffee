# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#reservations-table div.addIcon").live "click", ->
    parentTR = $(this).parents().get(1)
    $.ajax
      url: "/loadings/" + $(this).data('loadid') + "/addtoplan"
      success: ->
        parentTR.toggle()
    return false