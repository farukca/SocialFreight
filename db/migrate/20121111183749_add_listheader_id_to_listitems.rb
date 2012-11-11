class AddListheaderIdToListitems < ActiveRecord::Migration
  def change
    add_column :listitems, :listheader_id, :integer, null: false
  end
end
