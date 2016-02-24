$(document).on 'ready, page:change', ->
  $('#upload-photo-album').click ->
    $("input[type=file]").show().focus().click().hide()
    false

  opt =
    type: 'POST'
    url: "/admin/photos/upload"
    success: (data,status,xhr)->
      location.reload()

  $('input.file-window-photo-album').fileUpload(opt)
