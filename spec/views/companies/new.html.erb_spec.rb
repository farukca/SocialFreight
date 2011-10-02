require 'spec_helper'

describe "companies/new.html.erb" do
  before(:each) do
    assign(:company, stub_model(Company).as_new_record)
  end

  it "renders new company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path, :method => "post" do
    end
  end
end
