jQuery ->
  selectedloads = []
  loadnames = []
  selectedpos = []
  posname = []

  selectLoads = ->
    selectedloads = []
    loadnames = []
    selectedOpr = null
    $('#reservations_list input:checked').each ->
      if $(this).is(":checked")
        if selectedOpr
          if selectedOpr != $(this).data('operation')
            alert "Aynı Operasyonları seçmelisiniz"
            return false
        else
           selectedOpr = $(this).data('operation')

        selectedloads.push $(this).data('loadid')
        loadnames.push $(this).data('ref')

  selectPosition = ->
    selectedpos = []
    posname = []
    $('#positions_list input:checked').each ->
      if $(this).is(":checked")
        selectedpos.push $(this).data('positionid')
        posname.push $(this).data('ref')

  $('#create_plan_position').click ->
    selectLoads()
    unless selectedloads[0]
      alert "Lütfen yükleri Seçiniz"
      return false
    else
      alert loadnames

  $('#connect_to_position').click ->
    selectLoads()
    unless selectedloads[0]
      alert "Lütfen yükleri Seçiniz"
      return false
    else
      selectPosition()
      unless selectedpos[0]
        alert "Lütfen Pozisyon Seçiniz"
        return false
      else
        $.ajax
          url: "/positions/"+ selectedpos[0] +"/addload?loadids="+selectedloads[0]
          success: ->
            alert "Yükler Pozisyona Bağlandı"
        return false
