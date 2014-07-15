$(document).on('ready page:load', function() {

  $(window).scroll(function() {
  	var url = $('.pagination span.next').children().attr('href');
    if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      $('.pagination').text("Fetching more results...");
      return $.getScript(url);
    }
  });

  $('#new_review').submit(function(ev) {
  	ev.preventDefault();

  	$.ajax({
  		url: $(this).attr('action'),
  		type: 'POST',
  		dataType: 'json',
  		data: $(this).serialize()
  	}).done(function(data) {
  		var source   = $("#review-template").html();
      var template = Handlebars.compile(source);
      $('#review-list').append(template(data));
    });
  });
 });