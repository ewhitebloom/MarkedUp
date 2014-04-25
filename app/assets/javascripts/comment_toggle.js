$('.comment_toggle_button').on( 'click', function(event) {
  event.preventDefault();
  $(this).next().toggle();
});
