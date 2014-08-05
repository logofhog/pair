class Message < ActiveRecord::Base
  belongs_to :person

  scope :sent, -> {where(:sent => true)}
  scope :received, -> {where(:sent => false)}

  def send_message(sender, receivers)
    receivers.each do |receiver|
      message = self.dup
      message.sent = false
      message.unread = true
      message.person_id = receiver.id
      message.save
    end
    self.update_attributes :person_id => sender.id, :sent => true,
                           :unread => false
  end

  private
  

end
