class AddNameindexToCompanies < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE INDEX index_companies_on_lower_name
      ON companies(patron_token, patron_id, lower(name));
    SQL
  end
  
  def down
    remove_index :companies, :name => "index_companies_on_lower_name"
  end
end
