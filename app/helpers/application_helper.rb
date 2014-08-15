module ApplicationHelper
  def unread_messages
    count = current_user.messages.unread.count
    pluralize(count, 'Unread Message')
  end

end
