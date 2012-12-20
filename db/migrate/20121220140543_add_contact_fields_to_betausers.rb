class AddContactFieldsToBetausers < ActiveRecord::Migration
  def change
  	change_table :betausers do |t|
      t.string :name, limit: 100
      t.string :company, limit: 100
      t.string :phone, limit: 30
    end
  end
end
