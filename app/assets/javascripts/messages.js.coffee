$ ->
  $('.single_message').bind('click',(e) -> 
    id = $(this).closest('div').attr('id')
    $('#'+id+'.show_message_body').toggle()
    mark_as_read(id) if $(this).closest('div').hasClass 'unread'
    )

mark_as_read= (id) -> 
  $.ajax({
    type: "POST",
    url: "messages/mark_as_read",
    data: { 'message_id' : id  }
  })

