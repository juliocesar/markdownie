(function($) {
  Markdownie = {
    poll: poll
  }

  function poll() {
    $.get(window.location.pathname,
      { raw: true },
      function(html) {
        if (html != "") { $('#wrapper').html(html) };
        Markdownie.poll();
      }
    )
  }
  if (/^\/file/.test(window.location.pathname)) {
    poll();
  }
})(jQuery);
