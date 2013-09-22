# This migration comes from arsiv (originally 20130921111955)
class CreateArsivDocuments < ActiveRecord::Migration
  def change
    create_table :arsiv_documents do |t|
      t.string   :name, limit: 255, null: false
      t.date     :document_date, null:false
      t.string   :document_no
      t.string   :documented_type, limit: 100
      t.integer  :documented_id
      t.string   :status, limit: 10, default: "active"
      t.string   :country_id, limit: 20
      t.string   :description
      t.string   :document_file
      t.integer  :user_id, null: false
      t.integer  :patron_id, null: false      

      t.timestamps
    end

    add_index :arsiv_documents, :patron_id
    add_index :arsiv_documents, [:documented_type, :documented_id]
  end
end
