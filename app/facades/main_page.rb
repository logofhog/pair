class MainPage

  def initialize(current_user, proximity = 20)
    @current_user = current_user
    @proximity = proximity
  end

  def nearby
    @current_user.nearbys(@proximity)
  end

  def map_hash  
    hash = Gmaps4rails.build_markers(nearby) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
    end
  end

  def broadcasts 
    nearby_users = nearby
    broadcast_list = Broadcast.where(:broadcaster_id => nearby_users.to_a) 
    if broadcast_list.empty?
      Struct.new('Message', :message, :broadcaster)
      broadcast_list = [Struct::Message.new('There are no broadcasts in that area!', 'Staff')]

    end
    broadcast_list
  end

end


