$(function(){

  $('.comment-container').hide();
  $('.comment-btn ').on('click',function(){
    $('.comment-container').fadeToggle(700);
  });

// コメントの非同期投稿
  function buildHTML(comment){
    var html =`<p class="ml-3">
                <strong>
                  <a href="#">${comment.user_name}</a>
                  ：
                </strong>
                ${comment.text}
                <strong>   <a href= "", method: :delete, class="ml-5 text-danger">削除</a></strong>
              </p>`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html)
      $('.comment_box').val('')
      // 再送信可能に。場所あってる？
      $('#comment_submit').removeAttr("disabled");
    })
    .fail(function(){
      alert('コメントできませんでした');
      $('#comment_submit').removeAttr("disabled");
    })
  })
});