# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".dropdown-toggle").dropdown()
  $("a[rel=popover]").popover(offset: 10, delay:{show:1000, hide:500})
  $(".datepicker").datepicker
    format: 'yyyy-mm-dd'
    weekStart: 1
    todayBtn: "linked"
    calendarWeeks: true
    autoclose: true
    todayHighlight: true
  $(".alert-message").alert()
  $(".collapse").collapse('show')
  $("span.timeago").timeago()
  $(".slidingDiv").hide()
  $(".togglebutton").show()
  $(".togglebutton").click (event) ->
    $($(this).data('href')).slideToggle()
    event.preventDefault()
  $(".nexttab").click ->
    $($(this).data('newtab')).click()
  $(".chosen_select").each ->
    $(this).chosen()
  $(".country_select").each ->
    $(this).select2()
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
      placeholder: "Kayıt Seçiniz"
      minimumInputLength: 2
      width: "220px"
      minimumInputLength: 3
      ajax:
        url: el.data("url")
        dataType: "json"
        data: (term, page) ->
          q: term
          page_limit: 10
          page: page
          apikey: "ju6z9mjyajq2djue3gbvv26t"

        results: (data, page) ->
          results: data

      initSelection: (element, callback) ->
        $.getJSON (element.data("url")) + "?id=" + (element.val()), null, (data) ->
          if $.isFunction(callback)
            callback data[0] 

  $("#post_related_user_ids").select2
    placeholder: "Mail ile bilgilendirilecek kullanıcıları seçiniz"
    minimumInputLength: 2
    width: "100%"
    multiple: true
    ajax:
      url: "/users.json"
      dataType: "json"
      data: (term, page) ->
        q: term
        page_limit: 10
        page: page
        apikey: "ju6z9mjyajq2djue3gbvv26t"

      results: (data, page) ->
        results: data

    initSelection: (element, callback) ->
      $.getJSON (element.data("url")) + "?id=" + (element.val()), null, (data) ->
        if $.isFunction(callback)
          callback data[0] 

  $(".token_input").each ->
    el = $(this)
    el.tokenInput el.data("url"),
      crossDomain: false
      tokenLimit: 1
      prePopulate: el.data("pre")
      preventDuplicates: true

  #$("#post_message").mentionsInput onDataRequest: (mode, query, callback) ->
  #  $.getJSON "/nicks.json", (responseData) ->
  #    responseData = _.filter(responseData, (item) ->
  #      item.name.toLowerCase().indexOf(query.toLowerCase()) > -1
  #    )
  #    callback.call this, responseData
  formBlurTime = 0
  $("#post_message").focus ->
    $("form#new_post").removeClass "condensed-form"
    $("form#new_post").addClass "open-form"
  $("form#new_post").blur(->
    formBlurTime = setTimeout(->
      $("form#new_post").removeClass "open-form"
      $("form#new_post").addClass "condensed-form"
      $("form#new_post").trigger "blur"
    , 100)
    ).focus ->
      clearTimeout formBlurTime

  #$("#post_message").atWho "@",
  #  tpl: "" 
  #  callback: (query, callback) ->
  #    $.ajax
  #      url: "/nicks.json"
  #      dataType: "json"
  #      data: (term, page) ->
  #        q: query
  #        page: page
  #      success: (data) ->
  #        callback data
  $(".simple_form").find("input[type=text],textarea,select").filter(":visible:first").focus()