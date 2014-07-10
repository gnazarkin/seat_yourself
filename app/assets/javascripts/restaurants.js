 function display_search_results() {
    // readyState === 4 means that the asynchronous request completed successfully
    if (this.readyState === 4) {
      console.log(this);
      document.getElementById('restaurants').innerHTML = this.responseText;
    }
  }

$(document).on('ready page:load', function() {
  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();

    $.ajax({
      url: '/restaurants?search=' + searchValue,
      type: 'GET',
      dataType: 'html'
    }).done(function(data){
      $('#restaurants').html(data);
    });
  });
});