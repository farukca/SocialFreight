class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|
      t.string :name, :limit => 40
      t.string :vesseltype, :limit => 40
      t.string :owner, :limit => 60
      t.string :vesselflag, :limit => 2
      t.integer :teu
      t.string :imo, :limit => 30
      t.string :bodytype, :limit => 40

      t.timestamps
    end

    add_index :vessels, :owner
  end
end
