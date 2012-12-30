class Vehicle < ActiveRecord::Base
  
  extend FriendlyId
  include GeneratesNick

  friendly_id :code, use: :slugged, use: :scoped, scope: :patron_id

  validates :code, uniqueness: { scope: :patron_id, message: I18n.t('defaults.inputerror.must_be_unique') }, presence: { message: I18n.t('defaults.inputerror.cant_be_blank') }
  validates :vehicle_class, presence: { message: I18n.t('defaults.inputerror.cant_be_blank') }
  validates :vehicle_status, presence: { message: I18n.t('defaults.inputerror.cant_be_blank') }

  default_scope { where(patron_id: Patron.current_id) }

  def token_inputs
    { :id => code, :name => code }
  end

  def prepopulate_tokens
    [{ :id => _id, :name => code }]
  end

  def to_s
    code
  end

  def social_name
    self.slug
  end

end
