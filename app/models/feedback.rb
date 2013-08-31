class Feedback < ActiveRecord::Base

  belongs_to :patron, class_name: "Nimbos::Patron"

  attr_accessible :name, :email, :msg, :tel, :company

  validates :name, presence: true, length: { in: 2..40 }
  validates :email, presence: true, length: { in: 7..40 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :msg, length: { maximum: 500 }
  #validates :tel, length: { maximum: 20 }
  #validates :company, length: { maximum: 40 }

	after_create  :inform_about_feedback!

	def inform_about_feedback!
    Resque.enqueue(FeedbackMailerWorker, self.id)
	end

end