$(document).ready(function(){
var unfollow = function(el){
  var $this = $(el);
  var id = $this.closest('ul').data('instagram-id');
  //debugger;
  $.ajax({
    type: 'GET',
    url: '/unfollow/' + id
  });
  console.log('unfollowed ha ha')

}

var follow = function(el){
  var $this = $(el);
  var id = $this.closest('ul').data('instagram-id');
  //debugger;
  $.ajax({
    type: 'GET',
    url: '/follow/' + id
  });
  console.log('followed ha ha')
}


  $('.buttons span').on('click', function (e) {
    if ($(this).is('.unfollow')) {
      unfollow(this);
    } else {
      follow(this);
    }
    $(this).siblings().andSelf().toggleClass('active');
  });

  $(document).on('mouseenter mouseleave', '.buttons', function () {
      $(this).find('span').toggleClass('active');
  });
});

