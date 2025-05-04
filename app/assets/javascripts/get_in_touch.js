$(function() {
  var $form = $('#get-in-touch-contact-form');

  if ($form.length !== 0) {
    $form.on('ajax:send', function () {
      $('#form-response').html('');
      $('#error_explanation').html('');
      $('#get-in-touch-contact-form .btn-spinner').removeClass("d-none");
    });
  
    $form.on('ajax:complete', function () {
      $('#get-in-touch-contact-form .btn-spinner').addClass("d-none");
    });
  }
});