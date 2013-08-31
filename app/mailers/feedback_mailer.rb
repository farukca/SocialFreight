class FeedbackMailer < ActionMailer::Base
  #default from: "from@example.com"

  def feedback_created(feedback)
    @feedback = feedback
    mail(from: @feedback.email, to: Rails.application.config.contact_email, subject: 'New Feedback created, check it now')
  end
end
