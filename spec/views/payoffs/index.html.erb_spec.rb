require 'spec_helper'

describe "payoffs/index.html.erb" do
  before(:each) do
    assign(:payoffs, [
      stub_model(Payoff,
        :name => "Name",
        :staff_id => 1,
        :payoff_type => "Payoff Type",
        :transport_id => 1,
        :truck => "Truck",
        :vehicle => "Vehicle",
        :departure_km => 1,
        :departure_place => "Departure Place",
        :arrival_km => 1,
        :arrival_place => "Arrival Place",
        :return_km => 1,
        :return_place => "Return Place",
        :notes => "MyText",
        :approved => false,
        :user_id => 1,
        :patron_id => 1,
        :payaff_price => "9.99",
        :credit_debit => "Credit Debit"
      ),
      stub_model(Payoff,
        :name => "Name",
        :staff_id => 1,
        :payoff_type => "Payoff Type",
        :transport_id => 1,
        :truck => "Truck",
        :vehicle => "Vehicle",
        :departure_km => 1,
        :departure_place => "Departure Place",
        :arrival_km => 1,
        :arrival_place => "Arrival Place",
        :return_km => 1,
        :return_place => "Return Place",
        :notes => "MyText",
        :approved => false,
        :user_id => 1,
        :patron_id => 1,
        :payaff_price => "9.99",
        :credit_debit => "Credit Debit"
      )
    ])
  end

  it "renders a list of payoffs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payoff Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Truck".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Vehicle".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Departure Place".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Arrival Place".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Return Place".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Credit Debit".to_s, :count => 2
  end
end
