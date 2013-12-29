# This migration comes from messenger (originally 20131011115730)
class CreateMessengerMessages < ActiveRecord::Migration
  def change
    create_table :messenger_messages do |t|
      t.text     :message, null: false
      t.integer  :sender_id, null: false
      t.integer  :parent_id
      t.integer  :patron_id, null: false

      t.timestamps
    end
  end
end
