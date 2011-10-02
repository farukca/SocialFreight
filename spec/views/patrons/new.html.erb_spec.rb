require 'spec_helper'

describe "patrons/new.html.erb" do
  before(:each) do
    assign(:patron, stub_model(Patron).as_new_record)
  end

  it "renders new patron form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => patrons_path, :method => "post" do
    end
  end
end
