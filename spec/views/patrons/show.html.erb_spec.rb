require 'spec_helper'

describe "patrons/show.html.erb" do
  before(:each) do
    @patron = assign(:patron, stub_model(Patron))
  end

  it "renders attributes in <p>" do
    render
  end
end
