require 'spec_helper'

describe "positions/edit.html.erb" do
  before(:each) do
    @position = assign(:position, stub_model(Position))
  end

  it "renders the edit position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => positions_path(@position), :method => "post" do
    end
  end
end
