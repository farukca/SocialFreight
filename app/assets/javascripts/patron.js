function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}
$('.popover-company').hover(function() {
  var el = $(this);
  var _data = el.attr('alt');
  $.ajax({
    type: 'GET',
    url: el.attr('href'),
    data: _data,
    dataType: 'html',
    success: function(data) {
      el.attr('data-content', data);
      el.popover('show');
    }
  });
});
