# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("input.datepicker").datepicker()
  $(".slidingDiv").hide()
  $(".togglebutton").show()
  $("#menu").megaMenu('hover_fade')
  $('.togglebutton').click ->
     $(".slidingDiv").slideToggle()



