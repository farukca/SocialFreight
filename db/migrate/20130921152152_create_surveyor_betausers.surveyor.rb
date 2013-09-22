# This migration comes from surveyor (originally 20130921120557)
class CreateSurveyorBetausers < ActiveRecord::Migration
  def change
    create_table :surveyor_betausers do |t|
      t.string   :email
			t.string   :name, limit: 100
      t.string   :company, limit: 100
      t.string   :phone, limit: 30
      t.string   :country, limit: 20
      t.string   :ipaddr, limit: 20
      
      t.timestamps
    end
  end
end
