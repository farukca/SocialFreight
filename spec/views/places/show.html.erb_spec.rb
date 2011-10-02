require 'spec_helper'

describe "places/show.html.erb" do
  before(:each) do
    @place = assign(:place, stub_model(Place))
  end

  it "renders attributes in <p>" do
    render
  end
end
