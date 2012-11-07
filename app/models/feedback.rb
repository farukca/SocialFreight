class Feedback < ActiveRecord::Base

  belongs_to :patron
  
  validates_presence_of :name, :email, :msg, :message => "Lutfen bilgi giriniz"
  validates_length_of :name, maximum: 10, :message => "10 karakter giriniz"
  validates_length_of :msg, maximum: 1000

end
