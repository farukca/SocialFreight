# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".topbar").dropdown()
  $("a[rel=popover]").popover(offset: 10).click (e) ->
    e.preventDefault()
  $(".alert-message").alert()
  $(".slidingDiv").hide()
  $(".togglebutton").show()
  $('.togglebutton').click ->
     $($(this).data('href')).slideToggle()

  $(".lookup_input").each ->
    el = $(this)
    el.smartAutoComplete source: el.data("url"),
      typeAhead: true,
      forceSelect: true,
      maxResults: 5,
      minCharLimit: 3

  $(".token_input").each ->
    el = $(this)
    el.tokenInput el.data("url"),
      crossDomain: false
      tokenLimit: 1
      prePopulate: el.data("pre")
      preventDuplicates: true
  $("a[rel*=facebox]").facebox()

