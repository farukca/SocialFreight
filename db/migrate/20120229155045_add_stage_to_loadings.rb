class AddStageToLoadings < ActiveRecord::Migration
  def change
    change_table :loadings do |t|
      t.string :stage, :limit => 4
      t.timestamp :stage_date
    end
  end
end
