# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#departure_load_point').change ->
    place = $('#departure_load_point :selected').val()
    if (place != 'M')
      $('#customer_loading_address').hide()
    else
      $('#customer_loading_address').show()
  $('#arrival_unload_point').change ->
    place = $('#arrival_unload_point :selected').val()
    if (place != 'M')
      $('#customer_unloading_address').hide()
    else
      $('#customer_unloading_address').show()

  $('#departure_load_point').change()
  $('#arrival_unload_point').change()