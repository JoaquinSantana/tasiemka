$(document).on "page:change", ->
  $('#logo').hide().transition('jiggle')

  $('#logo').click ->
    $(this).addClass('animated flash')

  $('option').click ->
    $(this).closest(".site_wrapper").find('.articles_wrapper').one('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd', ->
      $(this).removeClass 'animated flash'
      return
    ).addClass 'animated flash'

  $('#knefel').click (e) ->
    e.stopPropagation()
    $('.ui.sidebar').sidebar('toggle')

  $('.ui.dropdown').dropdown();
  