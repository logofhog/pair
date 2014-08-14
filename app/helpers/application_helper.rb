module ApplicationHelper
  def unread_messages
    count = current_user.messages.count
    pluralize(count, 'Unread Message')
  end

end
