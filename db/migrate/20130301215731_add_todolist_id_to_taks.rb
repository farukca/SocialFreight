class AddTodolistIdToTaks < ActiveRecord::Migration
  def change
  	change_table :tasks do |t|
  		t.integer :todolist_id, null: false
  	end
  end
end
