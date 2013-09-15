class Contact < ActiveRecord::Base

  extend FriendlyId
  include Tire::Model::Search
  include Tire::Model::Callbacks
  index_name { "contacts-#{Nimbos::Patron.current_id}" }
  
  #belongs_to :patron
  belongs_to :company, counter_cache: true
  belongs_to :user, class_name: "Nimbos::User"

  friendly_id :to_s, use: :slugged, use: :scoped, scope: :patron

  attr_accessible :name, :surname, :salutation, :company_id, :user_id, :email, :tel, :gsm, :twitter, :facebook, :linkedin, 
                  :jobtitle, :department, :fax, :tel2, :des, :birthdate

  validates :name, length: { maximum: 30 }
  validates :surname, presence: true, length: { maximum: 30 }
  validates :email, length: { in: 7..90 }, format: { with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i }, :unless => Proc.new { |a| a.email.blank? }
  validates :tel, :gsm, length: { maximum: 15 }
  validates :jobtitle, length: { maximum: 40 }
  validates :department, length: { maximum: 60 }

  mapping do
    indexes :id, index: :not_analyzed
    indexes :name, analyzer: 'snowball', boost: 50
    indexes :surname, analyzer: 'snowball', boost: 100
    indexes :tel, index: :not_analyzed
    indexes :gsm, index: :not_analyzed
    indexes :email, index: :not_analyzed, boost: 100
    indexes :company_name, analyzer: 'snowball'
    indexes :jobtitle, analyzer: 'snowball'
    indexes :department, analyzer: 'snowball'
    indexes :created_at, type: 'date', index: :not_analyzed
  end

  def to_indexed_json
    {
      id: id,
      name: name,
      surname: surname,
      tel: tel,
      gsm: gsm,
      email: email,
      jobtitle: jobtitle,
      department: department,
      company_name: company_name,
      created_at: created_at
    }.to_json
  end

  default_scope { where(patron_id: Nimbos::Patron.current_id) }
  scope :latest, order("created_at desc")

  def to_s
    "#{name} #{surname}"
  end
  
  def company_name
    company.name
  end
end
