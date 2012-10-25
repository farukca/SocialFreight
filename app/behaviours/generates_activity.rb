module GeneratesActivity

  def self.included(base)
    base.send(:after_create, :generate_activity)
  end

  def generate_activity
    Activity.log(user_id, self, branch_id)
  end

end