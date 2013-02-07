class Event < ActiveRecord::Base

  belongs_to :patron
  belongs_to :company, counter_cache: true
  belongs_to :eventable, polymorphic: true, counter_cache: true
  belongs_to :user

  attr_accessible :event_date, :event_source, :event_status, :event_type, :company_id, :description, :source_url,
                  :eventable_type, :eventable_id, :event_title, :event_hour, :finish_date
  
  default_scope { where(patron_id: Patron.current_id) }
end
