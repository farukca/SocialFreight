module UsersHelper

  def user_name(user = @user)
  	user.to_s
  end

end
