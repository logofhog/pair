class Broadcast < ActiveRecord::Base
  belongs_to :user

  def broadcaster
    User.find(broadcaster_id).name
  end
end
