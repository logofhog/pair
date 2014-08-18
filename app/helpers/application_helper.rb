module ApplicationHelper
  def unread_messages
    count = current_user.messages.unread.count
    pluralize(count, 'Unread Message')
  end

  def button_message(filtered)
    filtered ? 'Show All Users' : 'Show only users with my interests' 
  end

  def button_toggle(value)
    !value
  end

end
