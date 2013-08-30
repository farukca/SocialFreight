class Person < ActiveRecord::Base


  belongs_to :patron, class_name: "Nimbos::Patron"

  belongs_to :user, class_name: "Nimbos::User"
  belongs_to :country, class_name: "Nimbos::Country"

  mount_uploader :avatar, AvatarUploader

  attr_accessible :name, :surname, :postcode, :address, :district, :city, :country_id, :state, :salutation,
                  :email, :website, :busitel, :gsm, :voip, :twitter, :facebook, :linkedin, :avatar, :patron_id, :patron_token,
                  :nation, :birth_date, :citizen_no, :start_date, :manager_id, :branch_id, :jobtitle, :department, 
                  :exttel, :socialname, :fax, :status, :hometel

  #validates :name, presence: true, length: { in: 2..30 }
  #validates :surname, presence: true, length: { in: 2..30 }

  default_scope { where(patron_id: Nimbos::Patron.current_id) }
  scope :latest, order("created_at desc")

  def to_s
    "#{self.name} #{self.surname}" 
  end

  def to_param
    "#{id}-#{to_s.parameterize}"
  end

  def token_inputs
    { :id => id, :text => to_s }
  end

  def prepopulate_tokens
    { :id => id, :text => to_s }
  end

end
