class Feedback < ActiveRecord::Base

  belongs_to :patron
  
  validates_presence_of :name, :email, :msg, :message => "Lütfen bilgi giriniz"
  validates_length_of :name, maximum: 40, :message => "10 karakter giriniz"
  validates_length_of :email, maximum: 40, :message => "10 karakter giriniz"
  validates_length_of :msg, maximum: 500

end
