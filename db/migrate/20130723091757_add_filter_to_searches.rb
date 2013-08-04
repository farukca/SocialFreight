class SetupHstore < ActiveRecord::Migration
  def self.up
    execute "CREATE EXTENSION IF NOT EXISTS hstore"
  end
  
  def self.down
    execute "DROP EXTENSION IF EXISTS hstore"
  end
end
class AddFilterToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :filter, :hstore
  end
end
