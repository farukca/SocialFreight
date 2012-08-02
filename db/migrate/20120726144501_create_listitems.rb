class CreateListitems < ActiveRecord::Migration
  def change
    create_table :listitems do |t|
      t.string :code
      t.string :name
      t.string :list_code
      t.string :i18n_code

      t.timestamps
    end
  end
end
