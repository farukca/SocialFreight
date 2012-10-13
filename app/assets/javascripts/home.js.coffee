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
  #$(".chosen_input").each ->
  #  el = $(this)
  #  el.ajaxChosen
  #    dataType: "json"
  #    type: "GET"
  #    url: el.data("url")
  #  ,
  #    processItems: (data) ->
  #      data
  #    loadingImg: "/assets/loading.gif"
  $(".chosen_input").each ->
    el = $(this)
    el.select2
      placeholder:
        title: "Kayıt Seçiniz"
      minimumInputLength: 2
      width: "220px"
      minimumInputLength: 3
      newRecordUrl:  el.data("newrecurl")

      ajax:
        url: el.data("url")
        dataType: "json"
        data: (term, page) ->
          q: term
          page_limit: 10
          page: page
          apikey: "ju6z9mjyajq2djue3gbvv26t"

        results: (data, page) ->
          results: data.results
      initSelection: (element, callback) ->
        callback
          id: $(element.val())
          text: $(element.data("selected"))

  #  initVal = el.data("selected")
  #  unless initVal is ""
  #    el.select2 "val",
  #      id: el.val()
  #      text: initVal

  #    initSelection: (element, callback) ->
  #      $.getJSON (el.data("url")) + "?id=" + (element.val()), null, (data) ->
  #        callback data if $.isFunction(callback)

  $(".token_input").each ->
    el = $(this)
    el.tokenInput el.data("url"),
      crossDomain: false
      tokenLimit: 1
      prePopulate: el.data("pre")
      preventDuplicates: true
  $("a[data-toggle=modal]").live 'click', ->
    target = $(this).attr('data-target')
    url = $(this).attr('href')
    $(target).load(url)
    $("#new_company").validate()

  $(".simple_form").find("input[type=text],textarea,select").filter(":visible:first").focus()