class AddPatronIdToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :patron_id, :integer
  end
end
