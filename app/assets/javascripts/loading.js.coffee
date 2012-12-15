jQuery ->
  $("#list_reservations").click ->
    $("#list_reservations").bind "click", false
    $("#project-reservation-list").html "<div id=\"loading\" style=\"height: 40px;\" />"
    $.ajax
      url: "/positions/" + $("#list_reservations").data("posref") + "/plan?listreservations=1",
      type: "GET",
      dataType: "JSON",
      success: (data) ->
        $("#project-reservation-list").html JST["templates/loadings/reservations"](reservations : data)
  $("#list_positions").click ->
    $("#list_positions").bind "click", false
    $("#loading-project-planning").html "<div id=\"loading\" style=\"height: 40px;\" />"
    $.ajax
      url: "/loadings/" + $("#list_positions").data("loadingref") + "/plan?listpositions=1",
      type: "GET",
      dataType: "JSON",
      success: (data) ->
        $("#loading-project-planning").html JST["templates/positions/positions"](positions : data)
    $("#list_positions").unbind "click", false
  $(".connect-loading-position").on "click", ->
    alert "1"