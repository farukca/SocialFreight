require 'spec_helper'

describe "places/index.html.erb" do
  before(:each) do
    assign(:places, [
      stub_model(Place),
      stub_model(Place)
    ])
  end

  it "renders a list of places" do
    render
  end
end
