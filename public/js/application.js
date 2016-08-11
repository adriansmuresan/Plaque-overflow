$(document).ready(function() {
  $('.display-commentbox').on('click', function(event) {
    event.preventDefault();
    /* Act on the event */
    var thisSection = $(this).parent();
    var formSection = $(thisSection).find('form');
    $(formSection).toggleClass('hidden');
    $(this).toggleClass('hidden');
  });


  $('.addcomment').on('submit', function(event) {
    event.preventDefault();
    /* Act on the event */
    $commentForm = $(this);
    var thisSection = $commentForm.parent();
    var displayButton = thisSection.find('button');
    var path = $($commentForm).attr('action');
    var method = $($commentForm).attr('method');

    $commentForm.toggleClass('hidden');
    displayButton.toggleClass('hidden');

    var toSend = $(this).serialize();

    $.ajax({
      url: path,
      type: method,
      data: toSend
    })
    .done(function(response) {
      console.log(response);
      $('.comment-container').append(response);
    });

  });
})
