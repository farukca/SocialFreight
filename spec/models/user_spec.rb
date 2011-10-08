require 'spec_helper'

describe User do
  describe "#send_password_reset" do 
    let(:user) { Factory(:user) }

    it "generates unique password reset token each time" do
      user.send_password_reset
      last_token = user.password_reset_token
      user.send_password_reset
      user.password_reset_token.should_not eq(last_token)
    end

    it "saves the time password reset was sent" do
      user.send_password_reset
      user.reload.password_reset_time.should be_present
    end

    it "delivers email to user" do
      user.send_password_reset
      last_email.to.should include(user.email)
    end

  end

end
