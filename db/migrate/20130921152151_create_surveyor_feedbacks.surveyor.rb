# This migration comes from surveyor (originally 20130921120545)
class CreateSurveyorFeedbacks < ActiveRecord::Migration
  def change
    create_table :surveyor_feedbacks do |t|
      t.string   :name, :limit => 40, :null => false
      t.string   :email, :limit => 100
      t.string   :msg, :limit => 500
      t.integer  :user_id
      t.integer  :patron_id
           
      t.timestamps
    end
  end
end
