class StaticPagesController < ApplicationController

  before_filter :require_login

  def index
    @main_page = MainPage.new(current_user)
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

