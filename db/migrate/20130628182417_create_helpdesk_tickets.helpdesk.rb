# This migration comes from helpdesk (originally 20130622144710)
class CreateHelpdeskTickets < ActiveRecord::Migration
  def change
    create_table :helpdesk_tickets do |t|
      t.string :title, null: false
      t.text :desc, null: false
      t.integer :user_id, null: false
      t.integer :patron_id, null: false
      t.string :status, :limit => 30, null: false
      t.integer :assigned_id
      t.date :close_date

      t.timestamps
    end
  end
end
