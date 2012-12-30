class Contact < ActiveRecord::Base

  extend FriendlyId
  
  belongs_to :patron
  belongs_to :company, counter_cache: true
  belongs_to :user

  friendly_id :to_s, use: :slugged, use: :scoped, scope: :patron

  attr_accessible :name, :surname, :salutation, :company_id, :user_id, :email, :tel, :gsm, :twitter, :facebook, :linkedin, 
                  :jobtitle, :department, :fax, :tel2, :des, :birthdate


  default_scope { where(patron_id: Patron.current_id) }
  scope :latest, order("created_at desc")

  def to_s
    "#{salutation} #{name} #{surname}"
  end
  
end
