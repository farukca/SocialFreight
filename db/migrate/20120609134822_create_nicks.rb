class CreateNicks < ActiveRecord::Migration
  def change
    create_table :nicks do |t|
      t.string :name, :limit => 30
      t.integer :patron_id
      t.references :nicknamed, :polymorphic => true

      t.timestamps
    end
    add_index :nicks, [:patron_id, :name], :unique => true, :name => "unique_nick_name"
  end
end
