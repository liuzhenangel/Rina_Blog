$(document).ready ->
  $('.header-circle').click ->
    if $('.start-misic').offset().left == 0
      $('.audio-tag')[0].pause()
      $('.stop-misic').hide()
      $('.start-misic').show()
    else
      $('.audio-tag')[0].play()
      $('.start-misic').hide()
      $('.stop-misic').show()

  $('.audio-tag')[0].onended = ->
    $('.stop-misic').hide()
    $('.start-misic').show()
