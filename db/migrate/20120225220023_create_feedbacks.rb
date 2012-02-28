class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string  :name, :limit => 40, :null => false
      t.string  :email, :limit => 40
      t.string  :msg, :limit => 500
      t.integer :user_id
      t.integer :patron_id
           
      t.timestamps
    end
  end
end
