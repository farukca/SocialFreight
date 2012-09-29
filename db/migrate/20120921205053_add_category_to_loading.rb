class AddCategoryToLoading < ActiveRecord::Migration
  def up
  	remove_column :loadings, :bank_id
  	add_column    :loadings, :bank, :string, limit: 100
  	add_column    :loadings, :category, :string, limit: 60
  end

  def down
  	add_column :loadings, :bank_id, :integer
  	remove_column :loadings, :bank
  	remove_column :loadings, :category
  end
end
