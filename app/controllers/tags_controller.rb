class TagsController < ApplicationController

  def create
    @user = current_user
    @user.tag_list.add(params[:tag], :parse => true)
    @user.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy
    current_user.tag_list.remove(tag_params)
    current_user.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
                   
  end

  private

  def tag_params
    params.require(:id)
  end

end

