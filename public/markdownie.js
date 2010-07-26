(function($) {
  Markdownie = {
    updated: "0",
    poll: poll
  }

  function poll() {
    $.get(window.location.pathname,
      { raw: true },
      function(html) {
        $('#wrapper').html(html);
        Markdownie.poll();
      }
    )
  }

  poll();
})(jQuery);