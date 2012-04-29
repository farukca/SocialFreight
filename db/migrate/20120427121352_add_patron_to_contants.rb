class AddPatronToContants < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.string  :jobtitle, :limit => 40
      t.string  :department, :limit => 60
      t.string  :tel2, :limit => 20
      t.string  :fax, :limit => 20
      t.date    :birthdate
      t.integer :patron_id
      t.string  :des, :limit => 255
    end
  end
end
