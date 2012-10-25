class Journal < ActiveRecord::Base

  belongs_to :journaled, polymorphic: true

  default_scope { where(patron_id: Patron.current_id) }
  
  def self.log(journaled, journal_model, patron_id, unit, amount)
    patron_id ||= user.patron_id

    journal = journaled.journals.first_or_initialize(patron_id: patron_id, process_date: Date.today, journal_model: journal_model)
    journal.increment(:unit, unit)
    journal.increment(:amount, amount)
    journal.save!

    journal
  end

end
