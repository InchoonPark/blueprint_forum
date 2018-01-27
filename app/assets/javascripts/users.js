$(document).on('turbolinks:load', function() {
  $(".user-preview-photo").click(function() {
    event.preventDefault();
    $('input[name="user[photo]"]').click();
  });

  $('input[name="user[photo]"]').change(function(event){
    var file = event.currentTarget.files[0];
    var reader = new FileReader();
    var preview = $(".user-preview-photo");

    reader.onload = function(event) {
      $(".user-preview-photo").attr("src", event.target.result);
    };

    reader.readAsDataURL(file);
  });
});
