class UserActivationMailer
	
  @queue = :mailer_queue

  def self.perform(user_id)
  	user = User.find(user_id)
    UserMailer.activation_needed_email(user).deliver
  end

end
