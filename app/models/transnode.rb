class Transnode < ActiveRecord::Base

  belongs_to :position
  belongs_to :supplier, :class_name => "Company", :foreign_key => "supplier_id"

  attr_accessible :position_id, :trans_method, :voyage, :vessel, :truck , :driver , :transporter_id, :forwarder_id, :supplier_id, 
                  :departure_place, :departure_date, :departured_date, :arrival_place, :arrival_date, :arrived_date, :freight_price, 
                  :freight_curr, :ticket_no, :ticket_date, :doc1_no, :doc2_no, :doc3_no, :doc4_no, :notes

  attr_accessor :fromwhere
  
  validates_presence_of :trans_method #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :voyage #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :vessel #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :departure_date #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :arrival_date #, :message => I18n.t('tasks.errors.name.cant_be_blank')

  default_scope { where(patron_id: Nimbos::Patron.current_id) }
  
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
