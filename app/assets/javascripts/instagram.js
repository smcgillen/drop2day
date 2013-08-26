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


  $('.toggle').toggles({
    type: 'select',
    text: {
      on: 'FOLLOW',
      off: 'UNFOLLOW'
    },
    width: 90
  }).on('toggle', function (e, active) {
    if (active) {
      unfollow(this);
    } else {
      follow(this);
    }
  });
});