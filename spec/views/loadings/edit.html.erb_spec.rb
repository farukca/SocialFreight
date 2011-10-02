require 'spec_helper'

describe "loadings/edit.html.erb" do
  before(:each) do
    @loading = assign(:loading, stub_model(Loading))
  end

  it "renders the edit loading form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loadings_path(@loading), :method => "post" do
    end
  end
end
