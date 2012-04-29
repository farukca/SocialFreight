require 'spec_helper'

describe "finunits/index.html.erb" do
  before(:each) do
    assign(:finunits, [
      stub_model(Finunit,
        :name => "Name",
        :curr => "Curr",
        :unit_type => "Unit Type",
        :branch_id => 1,
        :bank_id => 1,
        :bank_branch => "Bank Branch",
        :person_id => 1,
        :patron_id => 1,
        :patron_token => "Patron Token"
      ),
      stub_model(Finunit,
        :name => "Name",
        :curr => "Curr",
        :unit_type => "Unit Type",
        :branch_id => 1,
        :bank_id => 1,
        :bank_branch => "Bank Branch",
        :person_id => 1,
        :patron_id => 1,
        :patron_token => "Patron Token"
      )
    ])
  end

  it "renders a list of finunits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Curr".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bank Branch".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Patron Token".to_s, :count => 2
  end
end
