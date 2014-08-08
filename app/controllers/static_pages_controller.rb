class StaticPagesController < ApplicationController

  before_filter :require_login

  def index
    @current_user = current_user
    nearby = @current_user.nearbys(20)
    puts nearby
    
    @hash = Gmaps4rails.build_markers(nearby) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude
    end
  end

  private 
  
  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end


end

