class Broadcast < ActiveRecord::Base
  belongs_to :user

  validates :message, :presence => true
  validate :message_length

  def broadcaster
    User.find(broadcaster_id).name
  end

  private
  
  def message_length
    self.errors.add(:message_too_long, 'Your message is too long!') if 
        self.message.length > 255
  end
end
