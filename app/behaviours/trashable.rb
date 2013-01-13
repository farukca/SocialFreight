module Trashable
  extend ActiveSupport::Concern

  included do
    default_scope   where(trashed: false)
    scope :trashed, where(trashed: true)
  end

  def trash
    update_attribute :trashed, true
  end

  #def trash
  #  run_callbacks :destroy do
  #    update_column :deleted_at, Time.now
  #  end
  #end

  def recover
    # update_column not appropriate here as it uses the default scope
    update_attribute :trashed, nil
  end
end