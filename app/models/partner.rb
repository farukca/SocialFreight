class Partner < ActiveRecord::Base

  belongs_to :company, counter_cache: true, touch: true
  belongs_to :partner, :class_name => "Company", :foreign_key => "partner_id"

  attr_accessible :company_id, :partner_id, :user_id, :partner_type, :notes

  default_scope { where(patron_id: Nimbos::Patron.current_id) }

end
