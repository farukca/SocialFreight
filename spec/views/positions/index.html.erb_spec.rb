require 'spec_helper'

describe "positions/index.html.erb" do
  before(:each) do
    assign(:positions, [
      stub_model(Position),
      stub_model(Position)
    ])
  end

  it "renders a list of positions" do
    render
  end
end
