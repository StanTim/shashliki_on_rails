jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});

$('document').ready(function() {
  setTimeout(function() {
    $('#flash').slideUp();
  }, 3000);
});