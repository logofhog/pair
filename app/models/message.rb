class Message < ActiveRecord::Base
  belongs_to :receiver, :foreign_key => 'user_id', :class_name => 'User'
  belongs_to :sender, :foreign_key => 'sender_id', :class_name => 'User'

  scope :sent, -> {where(:sent => true)}
  scope :received, -> {where(:sent => false).order(created_at: :desc)}
  scope :unread, -> {where(:unread => true)}


  def send_message(sender, receivers)
    receivers.each do |receiver|
      message = self.dup
      message.sender_id = sender.id
      message.sent = false
      message.unread = true
      message.user_id = receiver.id
      message.save
    end
    self.update_attributes :user_id => sender.id, :sent => true,
                           :unread => false, :sender_id => sender.id
  end

  def mark_as_read
    update_attribute(:unread, false)
  end
  private

  

end
