
$(document).on('ready page:load', function() {

  $(window).scroll(function() {
  	var url = $('.pagination span.next').children().attr('href');
    if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      $('.pagination').text("Fetching more results...");
      return $.getScript(url);
    }
  });
});