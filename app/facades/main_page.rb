class MainPage

  def initialize(params_hash)
    @current_user = params_hash[:current_user]
    @proximity = params_hash[:proximity] || 20
    @interests = params_hash[:interests] 
  end

  def nearby
    users = @current_user.nearbys(@proximity)
    @interests ? users.tagged_with(@current_user.tag_list, :any => true) : users
  end

  def map_hash  
    nearby_users = nearby
    if nearby_users.empty?
      nearby_users = @current_user
    end
    hash = Gmaps4rails.build_markers(nearby_users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
    end
  end

  def broadcasts 
    users = nearby << @current_user.id
    broadcast_list = Broadcast.where(:broadcaster_id => users).
                                      sort_by(&:created_at).reverse
    if broadcast_list.empty?
      Struct.new('Message', :message, :broadcaster)
      broadcast_list = [Struct::Message.new('There are no broadcasts in your area!', 'Staff')]
    end
    broadcast_list
  end

end


