require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :company_code => "Company Code",
        :name => "Name",
        :address => "MyText",
        :phone => "Phone",
        :email => "Email",
        :fax => "Fax",
        :user_id => 1,
        :college_id => 2,
        :data => "Data"
      ),
      stub_model(Company,
        :company_code => "Company Code",
        :name => "Name",
        :address => "MyText",
        :phone => "Phone",
        :email => "Email",
        :fax => "Fax",
        :user_id => 1,
        :college_id => 2,
        :data => "Data"
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Data".to_s, :count => 2
  end
end
