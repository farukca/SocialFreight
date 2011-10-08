class UserMailer < ActionMailer::Base
  default from: "noreply@socialfreight.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_activation.subject
  #
  def user_activation(user)
    @user = user
    mail :to => user.email, :subject => "SocialFreight Account Activation"
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "SocialFreight Password Reset"
  end
end
