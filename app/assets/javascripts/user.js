$(function(){
  var result = $("#user-search-result");
  var user_list = $("#user-member-list");

  function appendUserList(user){
    console.log(result)
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}" id="addbutton" >追加</a>
                </div>`

     result.append(html);
  }

  function appendMember(id, name) {
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value='${id}'>
                  <p class='chat-group-user__name'>${name}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    user_list.append(html);
  }

  // function appendNoUser(user) {
  //   var html = `<div class="chat-group-user clearfix">
  //                 <p class="chat-group-user__name"></p>
  //                 <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="" data-user-name="" id="button" >追加</a>
  //                 </div>`
  // }

  $('#user-search-field').on('keyup', function(e){
    e.preventDefault();
    var input = $('#user-search-field').val();

      $.ajax({
        url: '/users',
        type: "GET",
        data: { keyword: input },
        dataType: 'json'
      })

    .done(function(users){
      console.table(users);
      $('#user-search-result').empty();
      if (users.length !== 0 ) {
        users.forEach(function(user){
          appendUserList(user);
        });
       }
      // else {
      //   appendNoUser("一致するユーザーがいません");
      // }
     })
      .fail(function(){
        alert('ユーザー検索に失敗しました。');
      })
    });


  $(document).on("click", '.chat-group-user__btn--add', function(){
    $(this).parent().remove();
    var id   = $(this).attr('data-user-id');
    var name = $(this).attr('data-user-name');
    console.log(id);
    console.log(name);

    appendMember(id, name);
  })
  $(document).on("click", '.js-remove-btn', function(){
    $(this).parent().remove();
  })
});
