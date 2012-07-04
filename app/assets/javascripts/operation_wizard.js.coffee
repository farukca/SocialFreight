# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#is_customer_no").click ->
    $("#new-customer-div").toggle()
    $("#old-customer-div").hide()
  $("#is_customer_yes").click ->
    $("#new-customer-div").hide()
    $("#old-customer-div").show()