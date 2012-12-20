class AddCountryIpToBetausers < ActiveRecord::Migration
  def change
  	change_table :betausers do |t|
      t.string :country, limit: 20
      t.string :ipaddr, limit: 20
    end
  end
end
