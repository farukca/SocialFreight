class AddSlugToContacts < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.string :slug, :limit => 60
      t.string :patron_token, :limit => 40
    end
  end
end
