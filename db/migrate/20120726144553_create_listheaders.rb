class CreateListheaders < ActiveRecord::Migration
  def change
    create_table :listheaders do |t|
      t.string :code
      t.string :name
      t.string :i18n_code
      t.string :description

      t.timestamps
    end
  end
end
