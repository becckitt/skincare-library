$(function() {
  $('.search-icon').click(function(){
    $('.search-form').addClass('visible');
    $('.search-form input[type=text]').focus();
    $('.search-icon').removeClass('show-icon');
  });

  $('.search-form').focusout(function() {
    $('.search-form').removeClass('visible');
    $('.search-icon').addClass('show-icon');
  })
});