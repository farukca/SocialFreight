class Company < ActiveRecord::Base

  acts_as_gmappable :process_geocoding => false, :validation => false
  acts_as_followable
  acts_as_likeable
  extend FriendlyId
  #include GeneratesNick
  include GeneratesActivity
  
  #belongs_to :patron
  belongs_to :branch
  #belongs_to :city
  #belongs_to :state
  belongs_to :country
  belongs_to :user
  belongs_to :saler, :class_name => User, :inverse_of => :saler
  belongs_to :parent, :class_name => Company, :inverse_of => :parent
  friendly_id :name, use: :slugged, use: :scoped, scope: :patron_id
  
  has_many :contacts
  has_many :events, as: :eventable, dependent: :destroy
  has_many :partners

  accepts_nested_attributes_for :contacts, :reject_if => proc { |a| a[:surname].blank? }, :allow_destroy => true
  has_many :comments, as: :commentable, dependent: :destroy

  attr_accessible :name, :title, :company_type, :branch_id, :postcode, :address, :district, :city, :country_id, :state, 
                  :email, :website, :tel, :gsm, :voip, :fax, :contact, :sector, :twitter_url, :facebook_url, :linkedin_url, 
                  :notes, :description, :saler_id, :parent_id, :contacts_attributes

  validates :name, uniqueness: { scope: :patron_id, message: I18n.t('defaults.inputerror.must_be_unique') }, length: { maximum: 50 }, presence: { message: I18n.t('defaults.inputerror.cant_be_blank') }
  validates :title, length: { maximum: 100 }
  validates :tel, :fax, :gsm, :voip, length: { maximum: 15 }
  validates :website, length: { maximum: 30 }
  validates :email, length: { in: 7..40 }, format: { with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i }, :unless => Proc.new { |a| a.email.blank? }
  validates :postcode, length: { maximum: 5 }
  validates :district, :city, :state, length: { maximum: 40 }
  validates :address, length: { maximum: 80 }
  validates :branch_id, presence: { message: I18n.t('defaults.inputerror.branch_is_blank') }
  validates :description, :notes, length: { maximum: 250 }

  #before_save   :get_coordinates
  before_create :set_initials, :set_contact_user

  after_create  :set_after_jobs


  default_scope { where(patron_id: Patron.current_id) }
  scope :latest, order("created_at desc")

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}, #{self.district}, #{self.city.name}, #{self.country.name}" 
  end

  def prevent_geocoding
    self.address.blank? #|| (!self.location.blank?)
  end

  class << self

    def company_types()
      company_types = {
        'CU' => 'Customer',
        'SU' => 'Supplier',
        'FA' => 'Foreign Agent',
        'BN' => 'Bank',
        'TO' => 'Tax Office',
        'XF' => 'Other'
      }
    end
  end

  def token_inputs
    { id: id, text: name }
  end

  def prepopulate_tokens
    { id: id, text: name }
  end

  def to_s
    name
  end

  private
  def set_initials
    self.company_no = Patron.generate_counter("Company", nil, nil)
  end
  
  def set_after_jobs
    self.user.follow!(self) if self.user
      #self.user.create_activity(self, name, patron_id, patron_token)
      #Patron.journal_record(self.patron_id, user, branch, nil, self.class.name, 1, 0)
  end

  def set_contact_user
    self.contacts.each do |contact|
      contact.user_id = self.user_id
    end
  end

end