class Currency < ActiveRecord::Base
  #include Mongoid::Document

  #field :code
  #field :name
  #field :symbol
  #field :multiplier, :type => Float, default: 1

  #key :code

  attr_accessible :code, :name, :symbol, :multiplier

  validates_presence_of :code, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_presence_of :name, :message => I18n.t('patrons.errors.title.cant_be_blank')
  validates_uniqueness_of :code, :case_sensitive => false
  validates_uniqueness_of :name, :case_sensitive => false

end
