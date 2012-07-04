# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".dropdown-toggle").dropdown()
  $("a[rel=popover]").popover(offset: 10, delay:{show:1000, hide:500})
  $(".alert-message").alert()
  $(".collapse").collapse('show')
  $("abbr.timeago").timeago()
  $(".slidingDiv").hide()
  $(".togglebutton").show()
  $(".togglebutton").click ->
     $($(this).data('href')).slideToggle()
  $(".nexttab").click ->
     $($(this).data('newtab')).click()
  $(".chosen_select").each ->
    $(this).chosen()
  $(".chosen_input").each ->
    el = $(this)
    el.ajaxChosen
      dataType: "json"
      type: "GET"
      url: el.data("url")
    ,
      processItems: (data) ->
        data
      loadingImg: "/assets/loading.gif"
  $(".token_input").each ->
    el = $(this)
    el.tokenInput el.data("url"),
      crossDomain: false
      tokenLimit: 1
      prePopulate: el.data("pre")
      preventDuplicates: true
  $("a[data-toggle=modal]").click ->
    target = $(this).attr('data-target')
    url = $(this).attr('href')
    $(target).load(url)
    event.preventDefault()

  $("#e7").select2
    placeholder:
      title: "Search for a movie"

    minimumInputLength: 3
    ajax:
      url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json"
      dataType: "jsonp"
      quietMillis: 100
      data: (term, page) ->
        q: term
        page_limit: 10
        page: page
        apikey: "ju6z9mjyajq2djue3gbvv26t"

      results: (data, page) ->
        more = (page * 10) < data.total
        results: data.movies
        more: more

    formatResult: format
    formatSelection: format

  $("form:not(.filter) :input:visible:enabled:first").focus()