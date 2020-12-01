//= require form_validations
//= require custom_validators

$(function(){
  $('#type_select').on('change', function(e){
    var type = $('#type_select').val();
    var selectize = $('#spot_select')[0].selectize;
    $.ajax({
      url: 'render_available_space_type',
      type: 'get',
      data: {'type': type },
      dataType: 'json',
      success: function(response) {
        selectize.clear();
        selectize.clearOptions();
        selectize.load(function(callback) {
            callback(response.data);
        });
      }
    });
  });


  var rules = {
    'unpark[parking_number]':            'required',
  }

  validateForm( $('form.unpark'), rules, {
  });

  var park_rules = {
    'parking_space[vehicle_number]': 'required',
    'parking_space[vehicle_type]':   'required',
    'parking_space[spot_number]':   'required',
  }

  validateForm( $('form.park'), park_rules, {
  });
});