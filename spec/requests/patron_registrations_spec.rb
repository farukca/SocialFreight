require 'spec_helper'

describe "PatronRegistrations" do
  it "record patron and create admin user" do
    patron = Patron.new
    visit new_patron_path
    fill_in "Title", :with => "Farukca"
    fill_in "Email", :with => "farukca@far.com"
    fill_in "Tel", :with => "5552891072"
    #fill_in "Fax", :with => patron.fax
    fill_in "Address", :with => "Kartal istanbul"
    click_button "Create Patron"
  end
end
