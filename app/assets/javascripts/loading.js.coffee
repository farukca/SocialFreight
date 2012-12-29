jQuery ->
  $("#list_reservations").click ->
    $("#list_reservations").bind "click", false
    $("#project-reservation-list").html "<div id=\"loading\" style=\"height: 40px;\" />"
    $.ajax
      url: "/positions/" + $("#list_reservations").data("posref") + "/plan?listreservations=1",
      type: "GET",
      dataType: "json",
      success: (data) ->
        $("#project-reservation-list").html JST["templates/loadings/reservations"](parent : data)

  $("#list_positions").click ->
    $("#list_positions").bind "click", false
    $("#loading-project-planning").html "<div id=\"loading\" style=\"height: 40px;\" />"
    $.ajax
      url: "/loadings/" + $("#list_positions").data("loadingref") + "/plan?listpositions=1",
      type: "GET",
      dataType: "json",
      success: (data) ->
        $("#loading-project-planning").html JST["templates/positions/positions"](parent : data)
    $("#list_positions").unbind "click", false