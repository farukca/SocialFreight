require 'spec_helper'

describe "payoffs/new.html.erb" do
  before(:each) do
    assign(:payoff, stub_model(Payoff,
      :name => "MyString",
      :staff_id => 1,
      :payoff_type => "MyString",
      :transport_id => 1,
      :truck => "MyString",
      :vehicle => "MyString",
      :departure_km => 1,
      :departure_place => "MyString",
      :arrival_km => 1,
      :arrival_place => "MyString",
      :return_km => 1,
      :return_place => "MyString",
      :notes => "MyText",
      :approved => false,
      :user_id => 1,
      :patron_id => 1,
      :payaff_price => "9.99",
      :credit_debit => "MyString"
    ).as_new_record)
  end

  it "renders new payoff form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payoffs_path, :method => "post" do
      assert_select "input#payoff_name", :name => "payoff[name]"
      assert_select "input#payoff_staff_id", :name => "payoff[staff_id]"
      assert_select "input#payoff_payoff_type", :name => "payoff[payoff_type]"
      assert_select "input#payoff_transport_id", :name => "payoff[transport_id]"
      assert_select "input#payoff_truck", :name => "payoff[truck]"
      assert_select "input#payoff_vehicle", :name => "payoff[vehicle]"
      assert_select "input#payoff_departure_km", :name => "payoff[departure_km]"
      assert_select "input#payoff_departure_place", :name => "payoff[departure_place]"
      assert_select "input#payoff_arrival_km", :name => "payoff[arrival_km]"
      assert_select "input#payoff_arrival_place", :name => "payoff[arrival_place]"
      assert_select "input#payoff_return_km", :name => "payoff[return_km]"
      assert_select "input#payoff_return_place", :name => "payoff[return_place]"
      assert_select "textarea#payoff_notes", :name => "payoff[notes]"
      assert_select "input#payoff_approved", :name => "payoff[approved]"
      assert_select "input#payoff_user_id", :name => "payoff[user_id]"
      assert_select "input#payoff_patron_id", :name => "payoff[patron_id]"
      assert_select "input#payoff_payaff_price", :name => "payoff[payaff_price]"
      assert_select "input#payoff_credit_debit", :name => "payoff[credit_debit]"
    end
  end
end
