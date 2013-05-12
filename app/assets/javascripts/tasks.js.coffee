# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).on 'click', '.edit_task_status input[type=checkbox]', ->
  $(this).parent('form').submit()
jQuery ->
  $(".dropdown_tasks").click ->
    $("#tasks_list").html "<div id=\"loading\" style=\"height: 40px;\" />"
    $.ajax
      url: "/tasks.json",
      type: "GET",
      dataType: "json",
      success: (data) ->
        $("#tasks_list").html JST["templates/tasks/tasks"](tasks : data)