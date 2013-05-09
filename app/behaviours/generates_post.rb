module GeneratesPost

  def self.included(base)
    base.send(:after_create, :generate_post)
  end

  def generate_post
    Post.log(user_id, self, self.to_s, "created", true)
  end

end