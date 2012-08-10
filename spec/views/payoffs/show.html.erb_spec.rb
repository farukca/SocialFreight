require 'spec_helper'

describe "payoffs/show.html.erb" do
  before(:each) do
    @payoff = assign(:payoff, stub_model(Payoff,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Payoff Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Truck/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Vehicle/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Departure Place/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Arrival Place/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Return Place/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Credit Debit/)
  end
end
