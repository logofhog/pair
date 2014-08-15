class Message < ActiveRecord::Base
  belongs_to :receiver, :foreign_key => 'user_id', :class_name => 'User'
  belongs_to :sender, :foreign_key => 'sender_id', :class_name => 'User'

  scope :sent, -> {where(:sent => true)}
  scope :received, -> {where(:sent => false).order(created_at: :desc)}
  scope :unread, -> {where(:unread => true)}

  validate :require_subject_or_message
  before_create :require_subject_line

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
  
  def require_subject_line
    self.subject = '(No Subject)' if self.subject.blank? 
  end

  def require_subject_or_message
    self.errors.add(:missing_data, 'Subject or body is required!') if 
                  self.subject.blank? && self.body.blank?
  end
  

end
