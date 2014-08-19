module UsersHelper

  def about(user) 
    user.about || 'This user has not added any information!'
  end
end
