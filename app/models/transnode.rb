class Transnode < ActiveRecord::Base
  #include Mongoid::Document
  #include Mongoid::Timestamps
  #include Mongoid::Slug
  
  #field :reference
  #field :trans_method
  #field :trans_type
  belongs_to :multimodal, polymorphic: true
  belongs_to :supplier, :class_name => "Company", :inverse_of => :supplier_transnodes
  #field :voyage
  #field :vessel
  #field :driver
  #field :vessel2
  #field :driver2
  belongs_to :load_place, :class_name => "Place", :inverse_of => :load_place
  #field :load_date, type: Date
  belongs_to :unload_place, :class_name => "Place", :inverse_of => :unload_place
  #field :unload_date, type: Date
  #field :freight_price, type: Float, default: 0;
  #field :freight_curr
  #field :ticket_no
  #field :ticket_date, type: Date
  #field :notes
  #slug  :reference, :scope => :position, :permanent => true
  #auto_increment :rec_number

  before_create :set_initials

  #attr_accessible 

  validates_presence_of :reference, :on => :update
  validates_presence_of :trans_method #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :trans_type #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :position #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :voyage #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :vessel #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :load_date #, :message => I18n.t('tasks.errors.name.cant_be_blank')
  validates_presence_of :unload_date #, :message => I18n.t('tasks.errors.name.cant_be_blank')

  private
  def set_initials
    counter = self.position.patron.generate_counter("Transport", self.trans_method, nil)
    self.reference = self.trans_method + "." + sprintf('%08d', counter)
    generate_slug!
  end

  class << self
    def trans_types()
      trans_types = {
        'PRE' => 'On Tasima',
        'FNL' => 'Son Tasima',
        'INT' => 'Ara Tasima'
      }
    end
  end

  class << self
    def trans_methods()
      trans_methods = {
        'A' => 'Air Trans',
        'S' => 'Sea Trans',
        'R' => 'Rail Trans',
        'T' => 'Road Trans'
      }
    end
  end

end
