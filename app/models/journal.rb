class Journal < ActiveRecord::Base
  #include Mongoid::Document
  #include Mongoid::Timestamps

  belongs_to :patron
  #field :patron_token
  #field :process_date, type: Date
  belongs_to :journaled, polymorphic: true
  #field :journal_model
  #field :unit, type: Integer, default: 0
  #field :amount, type: Float, default: 0.00

  def self.log(journaled, journal_model, patron_id, patron_token, unit, amount)
    patron_id ||= user.patron_id
    patron_token ||= user.patron.token

    journal = journaled.journals.find_or_initialize_by(patron_id: patron_id, patron_token: patron_token, process_date: Date.today, journal_model: journal_model)
    journal.inc(:unit, unit)
    journal.inc(:amount, amount)
    journal.save!

    journal
  end

end
