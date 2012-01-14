jQuery ->
  cities = $('#loading_departure_city').html()
  $('#loading_departure_country').change ->
    country = $('#loading_departure_country :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(cities).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#loading_departure_city').html(options)
    else
      $('#loading_departure_city').empty()

  $('#loading_arrival_country').change ->
    country = $('#loading_arrival_country :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(cities).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#loading_arrival_city').html(options)
    else
      $('#loading_arrival_city').empty()

  $(document).on "click", ".follow_button", ->
    $.ajax
      url: "/"+$(this).data('model')+"/"+$(this).data('loadid')+"/follow"
      success: ->
        $(this).html('&cross; UnFollow')
        $(this).removeClass('follow_button')
        $(this).removeClass('primary')
        $(this).addClass('unfollow_button')
        $(this).addClass('danger')
    return false
  $(document).on "click", ".unfollow_button", ->
    $.ajax
      url: "/"+$(this).data('model')+"/"+$(this).data('loadid')+"/unfollow"
      success: ->
        $(this).html('Follow')
        $(this).removeClass('unfollow_button')
        $(this).removeClass('danger')
        $(this).addClass('follow_button')
        $(this).addClass('primary')
    return false
