# This migration comes from helpdesk (originally 20130825194358)
class AddReferenceToTickets < ActiveRecord::Migration
  def change
  	change_table :helpdesk_tickets do |t|
  	  t.string  :reference, :limit => 30
  	end

  	execute "update helpdesk_tickets set reference=('TLP'|| lpad(id::text, 7, '0'));"
  end
end
