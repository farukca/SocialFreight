require 'spec_helper'

describe "PasswordResets" do

#  it "login succesfully with valid user" do
#    user = Factory(:user)
#    visit login_path
#    fill_in "Email", :with => user.email
#    fill_in "Password", :with => user.password
#    click_button "Reset Password"
#  end

#  it "login failed because of email or pass" do
#    visit login_path
#    fill_in "Email", :with => "far@far.com"
#    fill_in "Password", :with => "oyfarfara"
#    click_button "Login"
#  end

  it "mails to user when request password reset" do
    user = Factory(:user)
    visit login_path
    click_link "Password"
    fill_in "Email", :with => user.email
    click_button "Reset Password"
    page.should have_content("Email Sent")
    last_email.to.should include(user.email)
  end

end
