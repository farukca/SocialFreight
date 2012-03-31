class AddStatusToLoadings < ActiveRecord::Migration
  def change
    change_table :loadings do |t|
      t.string :status, :limit => 1, :default => 'A'
    end
  end
end
