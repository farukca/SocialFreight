# This migration comes from arsiv (originally 20130921114026)
class CreateArsivJunks < ActiveRecord::Migration
  def change
    create_table :arsiv_junks do |t|
      t.string :name, limit: 255, null: false
      t.string :junked_type, limit: 100, null: false
      t.integer :junked_id, null: false
      t.integer :user_id, null: false
      t.integer :patron_id, null: false
      t.text :desc

      t.timestamps
    end
    add_index :arsiv_junks, [:junked_type, :junked_id]
    add_index :arsiv_junks, [:user_id, :patron_id]
  end
end
