$(document).on('turbolinks:load', function() {

  function buildHTML(message){
  var addImage = (message.image !== null) ? `<img src="${message.image}">` : '';

    var html = `<div class="front-contents__center__user" data-id="${ message.id }">
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
      $('.front-contents__center').animate({scrollTop: $('.front-contents__center')[0].scrollHeight}, 'fast');
    })
    .fail(function(data){
      alert('入力してください');
      $('.front-contents__footer__form__send').prop('disabled', false);
    })
  });

  var interval = setInterval(function(){
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    var message_id = $(".front-contents__center__user").last().data('id');

    $.ajax({
      type: 'GET',
      url: location.href,
      data: {id: message_id },
      dataType: 'json'
    })

    .done(function(messages) {

        if(messages !== ""){
          var insertHTML = "";
          messages.forEach(function(message) {
            insertHTML += buildHTML(message);
          });
          $('.front-contents__center').append(insertHTML);
          }
        })
    .fail(function(messages){
      alert('自動更新に失敗しました');
      });
     } else {
       clearInterval(interval);
      }}, 5000 );
});
