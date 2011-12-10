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
