class Feedback
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :email
  field :msg

  index :email

  validates_presence_of :name, :email, :msg, :message => "Lutfen bilgi giriniz"
  validates_length_of :name, maximum: 10, :message => "10 karakter giriniz"
  validates_length_of :msg, maximum: 1000

end
