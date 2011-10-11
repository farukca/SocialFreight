class UserMailer < ActionMailer::Base
  default from: "noreply@socialfreight.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_activation.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = "http://0.0.0.0:3000/users/#{user.activation_token}/activate"
    mail :to => user.email, :subject => "SocialFreight Account Activation"
  end

  def activation_success_email(user)
    @user = user
    @url  = "http://0.0.0.0:3000/login"
    mail :to => user.email, :subject => "Welcome to SocialFreight"
  end

  def password_reset_email(user)
    @user = user
    mail :to => user.email, :subject => "SocialFreight Password Reset"
  end
end
