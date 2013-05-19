# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".country_select_old").each ->
    cs = $(this)
    cs.unbind("change").bind "change", ->
      selected   = cs.find("option").eq(@selectedIndex)
      strID = cs.attr("id")
      strID = strID.replace("country", "city")
      city_combo = $("#" + strID)  
      $.ajax
        dataType: "json"
        cache: false
        url: "/cities.json?country_id="+selected.val()
        timeout: 2000
        error: (XMLHttpRequest, errorTextStatus, error) ->
          alert "Failed to submit : " + errorTextStatus + " ;" + error
        success: (data) ->
          items = data
          $('option', city_combo).remove()
          $('<option value=""/>').appendTo(city_combo)
          $.each items, (i, opt) ->
            $("<option value=\"" + opt.id + "\">" + opt.name + "</option>").appendTo city_combo