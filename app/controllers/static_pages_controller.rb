class StaticPagesController < ApplicationController

  before_filter :require_login

  def index
    @main_page = MainPage.new(current_user)

#    @current_user = current_user
#    @nearby = @current_user.nearbys(20)
#    
#    @hash = Gmaps4rails.build_markers(@nearby) do |user, marker|
#        marker.lat user.latitude
#        marker.lng user.longitude
#    end
  end

  def show

  end


  private 
  
  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end


end

