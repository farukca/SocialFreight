class CreateCurrates < ActiveRecord::Migration
  def change
    create_table :currates do |t|
      
      t.integer :bank_id
      t.date :rate_date
      t.string :cur1
      t.string :cur2
      t.decimal :buying
      t.decimal :selling
      t.decimal :banknote_buying
      t.decimal :banknote_selling
      t.decimal :rate
      t.integer :ctime
      t.integer :bank_refid

      t.timestamps
    end
  end
end
