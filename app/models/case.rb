class Case < ActiveRecord::Base

  belongs_to :patron
  belongs_to :company, counter_cache: true
  belongs_to :user

  attr_accessible :case_date, :case_source, :case_status, :case_type, :company_id, :description, :source_url
end
