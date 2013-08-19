# This migration comes from nimbos (originally 20130811053342)
class CreateNimbosCurrencies < ActiveRecord::Migration
  def change
    create_table :nimbos_currencies, :id => false do |t|
      t.string   :code, :limit => 5, :null => false
      t.string   :name, :limit => 40, :null => false
      t.string   :symbol, :limit => 1
      t.decimal  :multiplier, :default => 1, :null => false, precision: 5

      t.timestamps
    end

    execute "ALTER TABLE nimbos_currencies ADD PRIMARY KEY (code);"
  end
end
