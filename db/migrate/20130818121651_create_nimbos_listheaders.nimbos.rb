# This migration comes from nimbos (originally 20130810193958)
class CreateNimbosListheaders < ActiveRecord::Migration
  def change
    create_table :nimbos_listheaders do |t|
      t.string   :code, null: false
      t.string   :name
      t.string   :i18n_code
      t.text     :description

      t.timestamps
    end
  end
end
