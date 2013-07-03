class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string  :name, :limit => 25, :null => false
      t.integer :owner_id
      t.string  :country, :limit => 15

      t.timestamps
    end
  end
end
