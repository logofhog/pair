class BroadcastList
  def initialize(params_hash)
    @page = params_hash[:page].to_i || 0
    @current_user = params_hash[:current_user]
    @proximity = params_hash[:proximity] || 20
    @interests = params_hash[:interests] == 'true'
  end

  def broadcasts 
    users = nearby << @current_user.id
    broadcast_list = Broadcast.where(:broadcaster_id => users).
                               includes(:user).
                               limit(20).offset(@page * 20).
                               order('created_at DESC')
    broadcast_list = empty_list if broadcast_list.empty?
    broadcast_list
  end
  
  def nearby
    users = @current_user.nearbys(@proximity)
    @interests ? users.tagged_with(@current_user.tag_list,
                                    :any => true) : users
  end

  def empty_list
    Struct.new('Message', :message, :broadcaster)
    broadcast_list = [Struct::Message.new(
                'There are no broadcasts in your area!', 'Staff')]
  end

end
