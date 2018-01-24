$(function(){
  $('#posts-grid').masonry({
    itemSelector: '.grid-item',
    percentPosition: true
  });

  $(".post-input").focusin(function() {
    $(this).parent().addClass("input-field-focus");
  });

  $(".post-input").focusout(function() {
    $(this).parent().removeClass("input-field-focus");
  });
});
