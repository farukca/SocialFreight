module UsersHelper

  def user_name(user = @user)
  	user.to_s
  end

  def first_name(user = @user)
    user.name
  end

  def user_small_avatar(user = @user)
    user.avatar_url(:small)
  end

  def user_mini_avatar(user = @user)
    user.avatar_url(:mini)
  end

  def users_active_tasks_count(user = @user)
    user.tasks.active.count
  end

  def users_unread_notifications_count(user = @user)
    user.mentioners(Post).count
  end

  def users_unread_messages_count(user = @user)
  	0
  end

end
