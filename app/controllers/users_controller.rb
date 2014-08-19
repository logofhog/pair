class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:about)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user == @user
  end

end
