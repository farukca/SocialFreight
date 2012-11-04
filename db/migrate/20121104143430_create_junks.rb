class CreateJunks < ActiveRecord::Migration
  def change
    create_table :junks do |t|
      t.string :name, limit: 120, null: false
      t.string :junked_type, limit: 100, null: false
      t.integer :junked_id, null: false
      t.integer :user_id, null: false
      t.integer :patron_id, null: false
      t.text :desc

      t.timestamps
    end
    add_index :junks, [:junked_type, :junked_id]
    add_index :junks, [:user_id, :patron_id]
  end
end