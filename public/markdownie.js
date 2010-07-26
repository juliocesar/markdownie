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
  if (/^\/file/.test(window.location.pathname)) {
    poll();
  }
})(jQuery);