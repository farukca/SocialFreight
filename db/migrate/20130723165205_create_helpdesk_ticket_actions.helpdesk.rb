# This migration comes from helpdesk (originally 20130723144836)
class CreateHelpdeskTicketActions < ActiveRecord::Migration
  def change
    create_table :helpdesk_ticket_actions do |t|
      t.integer :ticket_id, null: false
      t.integer :user_id, null: false
      t.string  :action_code, limit: 30, null: false
      t.string  :assigned, limit: 100

      t.timestamps
    end

    add_index :helpdesk_ticket_actions, :ticket_id
  end
end
