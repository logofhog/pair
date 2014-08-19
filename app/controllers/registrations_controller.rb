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

  def sign_in_as_guest
    @guest = User.find_by(:longitude => -84.3226498) ||
              User.new(:name => 'guest', 
                       :latitude => 33.944647, :longitude => -84.3226498)
    @guest.save(:validate => false)
    sign_in @guest
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :zip_code, :email, :password,
                                 :password_comfirmation)
  end
end 
