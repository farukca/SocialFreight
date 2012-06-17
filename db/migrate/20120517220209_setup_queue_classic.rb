class SetupQueueClassic < ActiveRecord::Migration
  def up
    QC::Setup.create
  end

  def down
    QC::Setup.drop
  end
end
