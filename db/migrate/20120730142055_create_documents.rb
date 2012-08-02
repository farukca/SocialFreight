class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string  :document_type, limit: 50, null: false
      t.date    :document_date, null:false
      t.string  :document_no
      t.string  :operation, limit: 20 
      t.references :documented, polymorphic: true
      t.string  :owner_reference, limit: 50
      t.integer :user_id, null: false
      t.integer :patron_id, null: false      
      t.date    :due_date
      t.integer :page_number, default: 1
      t.string  :status, limit: 1
      t.string  :country_id, limit: 20
      t.integer :city_id
      t.string  :description
      t.string  :document_file

      t.timestamps
    end
  end
end
