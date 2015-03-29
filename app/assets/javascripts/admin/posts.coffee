$(document).on 'ready, page:change', ->

  $('.preview-title').click ->
    $('.preview-title').addClass('active')
    $('.content-title').removeClass('active')
    $('#article_content').hide()
    $('.markdown-body').show()
    $('.markdown-body').html('加载中...')
    $.post '/preview', { body: $('#article_content').val() }, (data)->
      $('.markdown-body').html(data)
      false
    false

  $('.content-title').click ->
    $('.content-title').addClass('active')
    $('.preview-title').removeClass('active')
    $('.markdown-body').hide()
    $('#article_content').show()
    false

  $('#upload-photo').click ->
    $("input[type=file]").show().focus().click().hide()
    false

  opt =
    type: 'POST'
    url: "/photos"
    success: (data,status,xhr)->
      txtBox = $("#article_content")
      caret_pos = txtBox.caret('pos')
      src_merged = "\n" + data + "\n"
      source = txtBox.val()
      before_text = source.slice(0, caret_pos)
      txtBox.val(before_text + src_merged + source.slice(caret_pos+1, source.count))
      txtBox.caret('pos',caret_pos + src_merged.length)
      txtBox.focus()

  $('input[type=file]').fileUpload opt
