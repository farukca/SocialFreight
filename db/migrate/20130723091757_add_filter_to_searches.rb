class AddFilterToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :filter, :hstore
  end
end
