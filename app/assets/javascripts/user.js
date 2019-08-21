$(function(){
  $('section').hide().eq(0).show();
  $('.hunt-head li').eq(0).addClass('border-blue');
  // クリックしたタブが何番目のタブかをcontentに取得
  $('.hunt-head li').on('click',function(){
    var content = $('.hunt-head li').index(this);
    // 取得した番号と同じ番号のセクションを取得
    $('section').eq(content).show().siblings().hide();
    $('.hunt-head li').eq(content).addClass('border-blue').siblings().removeClass('border-blue');
  });
})