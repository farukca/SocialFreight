class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies, { :id => false } do |t|
      t.string  :code, :limit => 5, :null => false
      t.string  :name, :limit => 40, :null => false
      t.string  :symbol, :limit => 1
      t.float   :multiplier, :default => 1, :null => false
    end
    execute "ALTER TABLE currencies ADD PRIMARY KEY (code);"
  end
end
