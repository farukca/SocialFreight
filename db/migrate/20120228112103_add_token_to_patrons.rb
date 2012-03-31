class AddTokenToPatrons < ActiveRecord::Migration
  def change
    change_table :patrons do |t|
      t.string :token, :limit => 40
    end
  end
end
