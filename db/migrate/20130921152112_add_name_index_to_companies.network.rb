# This migration comes from network (originally 20130921104948)
class AddNameIndexToCompanies < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE INDEX index_companies_on_lower_name
      ON network_companies(patron_id, lower(name));
    SQL
  end
  
  def down
    remove_index :network_companies, name: "index_companies_on_lower_name"
  end
end
