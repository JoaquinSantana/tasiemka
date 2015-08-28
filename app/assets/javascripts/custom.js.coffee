$(document).on "page:change", ->
  $('.navbar-header').hide().transition('jiggle')

  $('.navbar-header').click ->
    $(this).addClass('animated flash')

  $('option').click ->
    console.log 'animacja'
    $(this).closest(".site_wrapper").find('.articles_wrapper').one('animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd', ->
      $(this).removeClass 'animated flash'
      return
    ).addClass 'animated flash'