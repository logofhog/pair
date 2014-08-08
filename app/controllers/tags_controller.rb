class TagsController < ApplicationController

  def create
    @user = current_user
    @user.tag_list.add(params[:tag])
    if @user.save
      redirect_to root_path
    else
      raise
    end
  end

  def destroy
    current_user.tag_list.remove(tag_params)
    current_user.save
    redirect_to root_path
  end

  private

  def tag_params
    params.require(:id)
  end

end

