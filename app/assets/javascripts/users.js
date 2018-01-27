$(document).on('turbolinks:load', function() {
  $(".file-input-btn").click(function() {
    event.preventDefault();
    $('input[name="user[photo]"]').click();
  });
});
