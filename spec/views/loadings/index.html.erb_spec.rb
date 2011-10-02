require 'spec_helper'

describe "loadings/index.html.erb" do
  before(:each) do
    assign(:loadings, [
      stub_model(Loading),
      stub_model(Loading)
    ])
  end

  it "renders a list of loadings" do
    render
  end
end
