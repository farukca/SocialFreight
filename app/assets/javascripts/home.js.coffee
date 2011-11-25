# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".topbar").dropdown()
  $(".tabs").tabs()
  $("a[rel=twipsy]").twipsy live: true
  $("a[rel=popover]").popover(offset: 10).click (e) ->
    e.preventDefault()
  $(".alert-message").alert()
  $("#menu").megaMenu('hover_fade')
  $(".slidingDiv").hide()
  $(".togglebutton").show()
  $('.togglebutton').click ->
     $($(this).data('href')).slideToggle()

