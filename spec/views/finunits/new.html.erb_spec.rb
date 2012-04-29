require 'spec_helper'

describe "finunits/new.html.erb" do
  before(:each) do
    assign(:finunit, stub_model(Finunit,
      :name => "MyString",
      :curr => "MyString",
      :unit_type => "MyString",
      :branch_id => 1,
      :bank_id => 1,
      :bank_branch => "MyString",
      :person_id => 1,
      :patron_id => 1,
      :patron_token => "MyString"
    ).as_new_record)
  end

  it "renders new finunit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => finunits_path, :method => "post" do
      assert_select "input#finunit_name", :name => "finunit[name]"
      assert_select "input#finunit_curr", :name => "finunit[curr]"
      assert_select "input#finunit_unit_type", :name => "finunit[unit_type]"
      assert_select "input#finunit_branch_id", :name => "finunit[branch_id]"
      assert_select "input#finunit_bank_id", :name => "finunit[bank_id]"
      assert_select "input#finunit_bank_branch", :name => "finunit[bank_branch]"
      assert_select "input#finunit_person_id", :name => "finunit[person_id]"
      assert_select "input#finunit_patron_id", :name => "finunit[patron_id]"
      assert_select "input#finunit_patron_token", :name => "finunit[patron_token]"
    end
  end
end
