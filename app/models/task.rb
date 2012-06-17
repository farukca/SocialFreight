class Task < ActiveRecord::Base

	belongs_to :user

	attr_accessible :task_text, :due_date

	validates :task_text, :presence => true, :length => { :minimum => 2, :maximum => 1000 }
    validates :cruser_id, :presence => true


end
