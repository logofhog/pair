class Broadcast < ActiveRecord::Base
  belongs_to :user

  validates :message, :presence => true

  def broadcaster
    User.find(broadcaster_id).name
  end
end
