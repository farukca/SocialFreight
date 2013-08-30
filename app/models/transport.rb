class Transport < ActiveRecord::Base

  belongs_to :position, counter_cache: true, touch: true
  belongs_to :supplier, class_name: "Company", foreign_key: "supplier_id"
  belongs_to :owner, class_name: "Company", foreign_key: "owner_id"
  belongs_to :driver, class_name: "Person", foreign_key: "driver_id"

  belongs_to :dep_country, class_name: "Nimbos::Country", foreign_key: "dep_country_id"
  belongs_to :arv_country, class_name: "Nimbos::Country", foreign_key: "arv_country_id"
  
  has_many :payoff
  has_many :transroutes
  accepts_nested_attributes_for :transroutes
  
  has_many :comments, as: :commentable, dependent: :destroy
  
  attr_accessible :position_id, :trans_method, :vessel, :voyage, :truck, :vagon, :driver_name, :driver_id, 
                  :owner_id, :supplier_id, :dep_place_id, :dep_city_id, :dep_country_id, :arv_place_id,
                  :arv_city_id, :arv_country_id, :departure_date, :departure_hour, :arrival_date, :arrival_hour, 
                  :freight_price, :freight_curr, :waybill_no, :waybill_date, :waybill_flag, :user_id,  :notes,
                  :dep_place_type, :arv_place_type, :dep_city, :dep_place, :arv_city, :arv_place
  
  validates_presence_of :trans_method
  validates_presence_of :departure_date
  validates_presence_of :arrival_date
  validates :dep_country, presence: true
  validates :arv_country, presence: true

  default_scope { where(patron_id: Nimbos::Patron.current_id) }
  scope :active, where(status: "A")

  class << self
    def trans_types()
      trans_types = {
        'PRE' => 'On Tasima',
        'FNL' => 'Son Tasima',
        'INT' => 'Ara Tasima'
      }
    end

    def trans_methods()
      trans_methods = {
        'air'  => 'Air Transportations',
        'sea'  => 'Sea Transportations',
        'rail' => 'Rail Transportations',
        'road' => 'Road Transportations'
      }
    end
  end

end
