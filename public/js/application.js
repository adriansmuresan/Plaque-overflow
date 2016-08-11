$(document).ready(function() {

  $('.vote-button').on('click', function(){
    event.preventDefault();
    var $form = $(this).parent();
    var button_val = $(this).attr('value')
    var value = {value: $(this).attr('value')}
    var button = this
    console.log("SENDING QUERY")
    $.ajax({
      method: $form.attr('method'),
      url: $form.attr('action'),
      data: value
    })
    .done(function(response){
      console.log("WE GOT A RESPONSE!")
      console.log(response)
      if (button_val == -1 ){
        if (response.new_vote == true){
          $(button).css("color", "red")
        }
        else{
          $(button).parent().parent().find('.upvote-button').css("color", "#8C8C8C")
        }
      }
      if (button_val == 1){
        if (response.new_vote == true){
          $(button).css("color", "green")
        }
        else{
          $(button).parent().parent().find('.downvote-button').css("color", "#8C8C8C")
        }
      }
      console.log($(button).parent().parent().find('.points'))
      console.log(response.new_score)
      $(button).parent().parent().find('.points').html(response.new_score)
    });

  });


})
