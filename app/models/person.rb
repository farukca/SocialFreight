class Person < ActiveRecord::Base

  extend FriendlyId

  belongs_to :patron
  friendly_id :to_s, use: :slugged, use: :scoped, scope: :patron

  belongs_to :user
  #belongs_to :branch
  #belongs_to :city
  #belongs_to :state
  belongs_to :country
  #belongs_to :manager, :class_name => "Person", :foreign_key => "manager_id"
  #has_many   :payoffs

  mount_uploader :avatar, AvatarUploader

  attr_accessible :name, :surname, :postcode, :address, :district, :city, :country_id, :state, :salutation,
                  :email, :website, :busitel, :gsm, :voip, :twitter, :facebook, :linkedin, :avatar, :patron_id, :patron_token,
                  :nation, :birth_date, :citizen_no, :start_date, :manager_id, :branch_id, :jobtitle, :department, 
                  :exttel, :socialname, :fax, :status, :hometel

  #validates :name, presence: true, length: { in: 2..30 }
  #validates :surname, presence: true, length: { in: 2..30 }

  def to_s
    "#{self.name} #{self.surname}" 
  end

  def token_inputs
    { :id => id, :text => to_s }
  end

  def prepopulate_tokens
    { :id => id, :text => to_s }
  end

end
