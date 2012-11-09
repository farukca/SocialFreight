class Transport < ActiveRecord::Base

  belongs_to :position
  belongs_to :supplier, class_name: "Company", foreign_key: "supplier_id"
  belongs_to :owner, class_name: "Company", foreign_key: "owner_id"
  belongs_to :driver, class_name: "Person", foreign_key: "driver_id"

  #belongs_to :dep_place, class_name: "Place", foreign_key: "dep_place_id"
  belongs_to :dep_country, class_name: "Country", foreign_key: "dep_country_id"
  #belongs_to :dep_city, class_name: "City", foreign_key: "dep_city_id"
  #belongs_to :arv_place, class_name: "Place", foreign_key: "arv_place_id"
  belongs_to :arv_country, class_name: "Country", foreign_key: "arv_country_id"
  #belongs_to :arv_city, class_name: "City", foreign_key: "arv_city_id"
  
  has_many   :payoff

  attr_accessible :position_id, :trans_method, :vessel, :voyage, :truck, :vagon, :driver_name, :driver_id, 
                  :owner_id, :supplier_id, :dep_place_id, :dep_city_id, :dep_country_id, :arv_place_id,
                  :arv_city_id, :arv_country_id, :departure_date, :departure_hour, :arrival_date, :arrival_hour, 
                  :freight_price, :freight_curr, :waybill_no, :waybill_date, :waybill_flag, :user_id,  :notes,
                  :dep_place_type, :arv_place_type, :dep_city, :dep_place, :arv_city, :arv_place
  
  validates_presence_of :trans_method #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  #validates_presence_of :voyage #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  #validates_presence_of :vessel #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :departure_date #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :arrival_date #, :message => I18n.t('tasks.errors.name.cant_be_blank')

  default_scope { where(patron_id: Patron.current_id) }
  
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
        'air'  => 'Air Trans',
        'sea'  => 'Sea Trans',
        'rail' => 'Rail Trans',
        'road' => 'Road Trans'
      }
    end
  end

end
