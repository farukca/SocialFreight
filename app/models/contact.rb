class Contact < ActiveRecord::Base

  extend FriendlyId
  
  belongs_to :patron
  belongs_to :company
  belongs_to :user

  friendly_id :to_s, use: :slugged#, :scope => :patron

  attr_accessible :name, :surname, :salutation, :company_id, :user_id, :email, :tel, :gsm, :twitter, :facebook, :linkedin, 
                  :jobtitle, :department, :fax, :tel2, :des, :birthdate


  def to_s
    "#{salutation}. #{name} #{surname}"
  end
  
end
