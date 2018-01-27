$(document).on('turbolinks:load', function() {
  $("#new_comment").submit(function(event) {
    if($("#comment_description").val() == "") {
      event.preventDefault();
      return false;
    }
  });
  return;
});
