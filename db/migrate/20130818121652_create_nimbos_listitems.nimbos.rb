# This migration comes from nimbos (originally 20130810194053)
class CreateNimbosListitems < ActiveRecord::Migration
  def change
    create_table :nimbos_listitems do |t|
      t.string   :code, null: false, limit: 50
      t.string   :name, limit: 50
      t.string   :list_code
      t.string   :i18n_code
      t.integer  :listheader_id, null: false

      t.timestamps
    end
  end
end
