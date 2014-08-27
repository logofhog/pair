class MainPage

  attr_reader :interests

  def initialize(params_hash)
    @params_hash = params_hash
    @current_user = params_hash[:current_user]
    @proximity = params_hash[:proximity] || 20
    @interests = params_hash[:interests] == 'true'
  end

  def nearby
    users = @current_user.nearbys(@proximity)
    @interests ? users.tagged_with(@current_user.tag_list, :any => true) : users
  end

  def map_hash  
    nearby_users = nearby
    nearby_users = @current_user if nearby_users.empty?
    hash = Gmaps4rails.build_markers(nearby_users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
    end
  end

  def broadcasts 
    BroadcastList.new(@params_hash).broadcasts
  end

end


