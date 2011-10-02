require 'spec_helper'

describe "positions/new.html.erb" do
  before(:each) do
    assign(:position, stub_model(Position).as_new_record)
  end

  it "renders new position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => positions_path, :method => "post" do
    end
  end
end
