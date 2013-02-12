class Contact < ActiveRecord::Base

  extend FriendlyId
  
  belongs_to :patron
  belongs_to :company, counter_cache: true
  belongs_to :user

  friendly_id :to_s, use: :slugged, use: :scoped, scope: :patron

  attr_accessible :name, :surname, :salutation, :company_id, :user_id, :email, :tel, :gsm, :twitter, :facebook, :linkedin, 
                  :jobtitle, :department, :fax, :tel2, :des, :birthdate

  validates :name, length: { maximum: 30 }
  validates :surname, presence: true, length: { maximum: 30 }
  validates :email, length: { in: 7..90 }, format: { with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i }, :unless => Proc.new { |a| a.email.blank? }
  validates :tel, :gsm, length: { maximum: 15 }
  validates :jobtitle, length: { maximum: 40 }
  validates :department, length: { maximum: 60 }

  default_scope { where(patron_id: Patron.current_id) }
  scope :latest, order("created_at desc")

  def to_s
    "#{salutation} #{name} #{surname}"
  end
  
end
