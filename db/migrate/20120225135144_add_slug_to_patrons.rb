class AddSlugToPatrons < ActiveRecord::Migration
  def change
    change_table :patrons do |t|
      t.string :slug, :limit => 40
      t.index  :slug, :unique => true
    end
  end
end
