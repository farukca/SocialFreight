class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :loading_id, :null => false
      t.integer :container_id
      t.string  :pack_type, :null => false
      t.integer :total, :default => 0
      t.integer :dimension1
      t.integer :dimension2
      t.integer :dimension3
      t.float   :brutwg, :default => 0
      t.float   :netwg, :default => 0
      t.float   :volume, :default => 0
      t.float   :lada, :default => 0
      t.string  :imo, :limit => 20
      t.string  :gtip, :limit => 20
      t.string  :po, :limit => 20

      t.string  :description, :limit => 200
      t.string  :loading_notes, :limit => 200

      t.timestamps
    end

    add_index :packages, [:loading_id, :container_id]
  end
end
