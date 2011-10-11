require 'spec_helper'

describe UserMailer do
  describe "#password_reset" do 
    let(:user) { Factory(:user, :password_reset_token => "anything") }
    let(:mail) { UserMailer.password_reset_email(user) }

    it "sends user password reset url" do
      mail.subject.should eq("SocialFreight Password Reset")
      mail.to.should eq([user.email])
      mail.from.should eq(["noreply@socialfreight.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match(edit_password_reset_path(user.password_reset_token))
    end
  end

end
