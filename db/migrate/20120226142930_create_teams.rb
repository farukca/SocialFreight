class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string  :name, :limit => 40
      t.integer :patron_id, :null => false
      t.string :patron_token, :limit => 20, :null => false
      t.string  :slug, :limit => 40
      
      t.timestamps
    end
    
    add_index :teams, [:patron_id, :patron_token]
  end
end
