$(document).ready(function(){
  $('.toggle').toggles({
    type: 'select',
    text: {
      on: 'FOLLOW',
      off: 'UNFOLLOW'
    },
    width: 90
  });
});