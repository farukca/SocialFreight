# This migration comes from logistics (originally 20130911200326)
class CreateLogisticsPositions < ActiveRecord::Migration
  def change
    create_table :logistics_positions do |t|
      t.string   :reference, limit: 30, null: false
      t.string   :title, limit: 255, null: false
      t.integer  :branch_id, null: false
      t.integer  :user_id, null: false
      t.string   :status, limit: 10, default: 'active'
      t.date     :report_date
      t.string   :slug, limit: 40
      t.boolean  :trashed, default: false
      t.text     :notes
      t.integer  :patron_id, null: false
      t.integer  :loadings_count, default: 0
      t.integer  :transports_count, default: 0
      t.integer  :documents_count, default: 0
      
      t.timestamps
    end

    add_index :logistics_positions, [:reference, :patron_id], unique: true
    add_index :logistics_positions, [:patron_id, :user_id]
    add_index :logistics_positions, [:patron_id, :branch_id]
  end
end
