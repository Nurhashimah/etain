require 'spec_helper'

describe "companies/show" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :company_code => "Company Code",
      :name => "Name",
      :address => "MyText",
      :phone => "Phone",
      :email => "Email",
      :fax => "Fax",
      :user_id => 1,
      :college_id => 2,
      :data => "Data"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Company Code/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Phone/)
    rendered.should match(/Email/)
    rendered.should match(/Fax/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Data/)
  end
end
