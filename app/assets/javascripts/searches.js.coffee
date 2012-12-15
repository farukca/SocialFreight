jQuery ->
  $(".saveascsv").click ->
    source = $(this).data("table")
    csv = $(source).table2CSV({delivery:'value'})
    window.location.href = "data:text/csv;charset=UTF-8," + encodeURIComponent(csv)    