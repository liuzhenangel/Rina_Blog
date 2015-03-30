$(document).on 'ready, page:change', ->

  $('.slider').tilesSlider({ random: true })

  $slider = $('.slider-wrap')
  html = $slider.html()

  defaults =
    thumbSize: 20,
    onSlideshowEnd: -> $('.stop, .start').toggle()

  effects =
    'default': { x:6, y:4, random: true },
    simple: { x:6, y:4, effect: 'simple', random: true },
    left: { x:1, y:8, effect: 'left' },
    up: { x:20, y:1, effect: 'up', rewind: 60, backReverse: true },
    leftright: { x:1, y:8, effect: 'leftright' },
    updown: { x:20, y:1, effect: 'updown', cssSpeed: 500, backReverse: true },
    switchlr: { x:20, y:1, effect: 'switchlr', backReverse: true },
    switchud: { x:1, y:8, effect: 'switchud' },
    fliplr: { x:20, y:1, effect: 'fliplr', backReverse: true },
    flipud: { x:20, y:3, effect: 'flipud', reverse: true, rewind: 75 },
    reduce: { x:6, y:4, effect: 'reduce' },
    360: { x:1, y:1, effect: '360', fade: true, cssSpeed: 600 }

  $('.start').click ->
    $(this).hide()
    $('.stop').show()
    $('.audio-tag')[0].play()
    $('.slider').tilesSlider('start')

  $('.stop').click ->
    $(this).hide()
    $('.audio-tag')[0].pause()
    $('.start').show()
    $('.slider').tilesSlider('stop')

  $('.slider').tilesSlider( $.extend( {}, defaults, effects['default'] ) )
