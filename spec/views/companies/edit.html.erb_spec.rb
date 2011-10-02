require 'spec_helper'

describe "companies/edit.html.erb" do
  before(:each) do
    @company = assign(:company, stub_model(Company))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path(@company), :method => "post" do
    end
  end
end
