$(function(){
  function buildHTML(message){
  var addImage = (message.image !== null) ? `<img src="${message.image}">` : '';

    var html = `<div class="front-contents__center__user">
                  <div class="front-contents__center__user__name-time">
                    <div class="front-contents__center__user__name-time__name">
                      ${ message.user_name }
                    </div>
                    <div class="front-contents__center__user__name-time__time">
                      ${ message.created_at }
                    </div>
                    <div class="front-contents__center__user__message">
                      ${ message.body }
                      ${ addImage }
                    </div>
                  </div>
                </div>`
   return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = location.href;

    $.ajax({
      url: url,
      type: "POST",
      data: formData ,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function (data){
      var html = buildHTML(data);
      $('.front-contents__center').append(html);
      $('.front-contents__footer__form__send').prop('disabled', false);
      $('#message_body').val("");
      $('.icon').val("");
      $('.front-contents__center').animate({scrollTop: $('.front-contents__center__user__content')[0].scrollHeight}, fast);
    })
    .fail(function(data){
      alert('入力してください');
      $('.front-contents__footer__form__send').prop('disabled', false);
    });
  });
});
