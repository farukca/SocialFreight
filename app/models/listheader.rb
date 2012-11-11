class Listheader < ActiveRecord::Base

  has_many :listitems

  accepts_nested_attributes_for :listitems, :reject_if => lambda { |a| a[:code].blank? }, allow_destroy: true

  attr_accessible :code, :description, :i18n_code, :name, :listitems_attributes

  before_save :set_item_code

private
  def set_item_code

    self.listitems.each do |item|
    	item.list_code = self.code
    end

  end

end
