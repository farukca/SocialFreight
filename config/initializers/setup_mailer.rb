ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "socialfreight.com",
  :user_name            => "faruk@socialfreight.com",
  :password             => "farukca6",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "socialfreight.com"
