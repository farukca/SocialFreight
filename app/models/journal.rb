class Journal < ActiveRecord::Base
  #include Mongoid::Document
  #include Mongoid::Timestamps

  belongs_to :patron
  belongs_to :journaled, polymorphic: true

  def self.log(journaled, journal_model, patron_id, patron_token, unit, amount)
    patron_id ||= user.patron_id
    patron_token ||= user.patron.token

    journal = journaled.journals.first_or_initialize(patron_id: patron_id, patron_token: patron_token, process_date: Date.today, journal_model: journal_model)
    journal.increment(:unit, unit)
    journal.increment(:amount, amount)
    journal.save!

    journal
  end

end
