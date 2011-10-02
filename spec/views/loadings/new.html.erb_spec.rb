require 'spec_helper'

describe "loadings/new.html.erb" do
  before(:each) do
    assign(:loading, stub_model(Loading).as_new_record)
  end

  it "renders new loading form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loadings_path, :method => "post" do
    end
  end
end
