class SetEventsCompanyIdNullable < ActiveRecord::Migration
  def up
  	change_column(:events, :company_id, :integer, null: true)
  end

  def down
  	change_column(:events, :company_id, :integer, null: false)
  end
end
