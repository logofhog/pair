class RegistrationsController < Devise::RegistrationsController
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      flash[:error]= @user.errors.full_messages
      render 'new'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :zip_code, :email, :password,
                                 :password_comfirmation)
  end
end 
