jQuery ->
  $("a[data-toggle=modal]").live 'click', ->
    target = $(this).attr('data-target')
    url = $(this).attr('href')
    $(target).load(url)