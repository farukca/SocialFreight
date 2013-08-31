class FeedbackMailerWorker
	
  @queue = :feedback_mailer_queue

  def self.perform(feedback_id)

  	feedback = Feedback.find(feedback_id)

  	FeedbackMailer.feedback_created(feedback).deliver
		
  end

end
