class Todolist < ActiveRecord::Base
  
  has_many :tasks

  attr_accessible :name, :user_id, :todop_type, :todop_id, :tasks_attributes

  accepts_nested_attributes_for :tasks

  validates :name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :user_id, presence: true

  default_scope { where(patron_id: Patron.current_id) }

end