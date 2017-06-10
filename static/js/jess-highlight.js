window.addEventListener('DOMContentLoaded', function() {
  function setDimensions(el, bgEl) {
    var rect = el.getBoundingClientRect();

    bgEl.style.top = window.scrollY + rect.top - 4 + 'px';
    bgEl.style.left = window.scrollX + rect.left - 4 + 'px';
    bgEl.style.height = rect.height + 8 + 'px';
    bgEl.style.width = rect.width + 8 + 'px';
  }

  document.querySelectorAll('[data-jess-highlight]').forEach(function(el) {
    var bgEl = document.createElement('div');
    var resize = setDimensions.bind(null, el, bgEl);

    bgEl.className = 'jess-highlight-bg ' +
                     el.getAttribute('data-jess-highlight');

    document.body.insertBefore(bgEl, document.body.firstChild);

    resize();
    window.addEventListener('resize', resize);
  });
});
