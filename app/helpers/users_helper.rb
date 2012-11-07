module UsersHelper

  def user_name(user = @user)
  	user.to_s
  end

  def user_small_avatar(user = @user)
    user.avatar_url(:small)
  end

end
