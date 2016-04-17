$(function() {
  var $state = $('select#attendee_state');
  var $cities = $('select#attendee_city');

  $state.on('change', function() {
    var state = $(this).val();

    $cities.html("<option>Carregando cidades...</option>");

    $.getJSON("/inscritos/cities.json?state=" + state, function(data) {
      var cities = data.cities;
      var html = '';

      $.each(cities, function() {
        html += '<option value="'+ this +'">'+ this +'</option>'
      });

      $cities.html(html);
    });
  }).change();
});
