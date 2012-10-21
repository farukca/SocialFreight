class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      
      t.string :name, limit: 40, null: false
      t.string :code, limit: 10
      t.string :service_code, limit: 10
      t.string :service_url, limit: 255
      t.string :response_type, limit: 10
      t.string :country, limit: 10
      t.string :currency, limit: 5

      t.timestamps
    end
  end
end
