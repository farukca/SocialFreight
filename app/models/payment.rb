class Payment < ActiveRecord::Base

  belongs_to :staff, class_name: "Person", foreign_key: "staff_id"

  belongs_to :branch
  belongs_to :payoff
  belongs_to :finunit
  belongs_to :confirmer, class_name: "Nimbos::User"

  attr_accessible :finunit_id, :payment_date, :payment_price, :payoff_id, :price_curr, :staff_id, :branch_id, 
                  :payment_docno, :notes

  validates :staff_id, presence: { message: I18n.t('defaults.inputerror.cant_be_blank') }
  validates :payment_price, presence: true
  validates :payment_date, presence: true
  validates :price_curr, presence: true
  validates :payoff_id, presence: true
  validates :branch_id, :presence => { :message => I18n.t('defaults.inputerror.branch_is_blank') }
  
  default_scope { where(patron_id: Nimbos::Patron.current_id) }
end
