# = require jquery
# = require jquery_ujs
# = require jquery.sticky-kit

$(document).ready ->
  # $('.node-sidebar').sticky({ topSpacing: 16 })
  # $('.ad-fixed').sticky({ topSpacing: 16 })
  $(".node-sidebar").stick_in_parent(parent: 'body', offset_top: 16)
  $('.ad-fixed').stick_in_parent(parent: 'html', offset_top: 16)

  $('.more-node').mouseenter ->
    $('.h-dropdown').show()
  .mouseleave ->
    $('.h-dropdown').hide()
