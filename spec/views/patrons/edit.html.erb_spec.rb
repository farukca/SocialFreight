require 'spec_helper'

describe "patrons/edit.html.erb" do
  before(:each) do
    @patron = assign(:patron, stub_model(Patron))
  end

  it "renders the edit patron form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => patrons_path(@patron), :method => "post" do
    end
  end
end
