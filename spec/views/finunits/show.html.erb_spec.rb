require 'spec_helper'

describe "finunits/show.html.erb" do
  before(:each) do
    @finunit = assign(:finunit, stub_model(Finunit,
      :name => "Name",
      :curr => "Curr",
      :unit_type => "Unit Type",
      :branch_id => 1,
      :bank_id => 1,
      :bank_branch => "Bank Branch",
      :person_id => 1,
      :patron_id => 1,
      :patron_token => "Patron Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Curr/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Bank Branch/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Patron Token/)
  end
end
