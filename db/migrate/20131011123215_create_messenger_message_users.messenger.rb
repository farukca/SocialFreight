# This migration comes from messenger (originally 20131011121247)
class CreateMessengerMessageUsers < ActiveRecord::Migration
  def change
    create_table :messenger_message_users do |t|
      t.integer  :user_id, null: false
      t.integer  :message_id, null: false
      t.boolean  :is_read, default: false
      t.timestamp :read_at

      t.timestamps
    end
  end
end
