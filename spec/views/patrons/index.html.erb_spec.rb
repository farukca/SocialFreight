require 'spec_helper'

describe "patrons/index.html.erb" do
  before(:each) do
    assign(:patrons, [
      stub_model(Patron),
      stub_model(Patron)
    ])
  end

  it "renders a list of patrons" do
    render
  end
end
