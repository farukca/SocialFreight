require 'spec_helper'

describe "loadings/show.html.erb" do
  before(:each) do
    @loading = assign(:loading, stub_model(Loading))
  end

  it "renders attributes in <p>" do
    render
  end
end
