var validateForm = function($form, rules, messages){
  $($form).validate({
    rules: rules,
    ignore: ':hidden:not([class~=selectized]),:hidden > .selectized',
    messages: messages,
    errorElement: "span",
    errorPlacement: function ( error, element ) {
      error.addClass( "error" );
      element.closest( "*[class^='col-'] input" ).addClass( "has-feedback" );
      if ( element.prop( "type" ) === "checkbox" ) {
        error.insertAfter( element.parent( "label" ) );
      } else if (element.is('select')){
        error.insertAfter( element.siblings('.selectize-control') )
      } else {
        error.insertAfter( element );
      }
    },
    success: function ( label, element ) {
      label.removeClass( "error" );
    },
    highlight: function ( element, errorClass, validClass ) {
      $( element ).closest( "*[class^='col-']" ).addClass( "has-error" ).removeClass( "has-success" );
    },
    unhighlight: function ( element, errorClass, validClass ) {
      $( element ).closest( "*[class^='col-']" ).addClass( "has-success" ).removeClass( "has-error" );
    }
  });
};