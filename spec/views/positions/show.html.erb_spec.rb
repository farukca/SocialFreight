require 'spec_helper'

describe "positions/show.html.erb" do
  before(:each) do
    @position = assign(:position, stub_model(Position))
  end

  it "renders attributes in <p>" do
    render
  end
end
