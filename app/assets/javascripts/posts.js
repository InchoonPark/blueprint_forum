$(document).on('turbolinks:load', function() {
  $('#posts-grid').masonry({
    itemSelector: '.grid-item',
    percentPosition: true
  });

  $(".file-input-btn").click(function() {
    event.preventDefault();
    $("input[name=post-file]").click();
  });

  $("input[name=post-file]").change(function(event){
    var file = event.currentTarget.files[0];
    var reader = new FileReader();
    var preview = $(".preview");

    reader.onload = function(event) {
      $(".file-input-btn").attr("style", "margin-bottom: 20px;")
      $(".preview").attr("src", event.target.result);
    };

    reader.readAsDataURL(file);
  });
});
