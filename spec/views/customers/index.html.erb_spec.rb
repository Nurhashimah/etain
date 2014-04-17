require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :id_no => "Id No",
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :corporate => false,
        :company_id => 1,
        :user_id => 2,
        :college_id => 3,
        :data => "Data"
      ),
      stub_model(Customer,
        :id_no => "Id No",
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :corporate => false,
        :company_id => 1,
        :user_id => 2,
        :college_id => 3,
        :data => "Data"
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Id No".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Data".to_s, :count => 2
  end
end
