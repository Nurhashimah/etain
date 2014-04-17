require 'spec_helper'

describe "payments/index" do
  before(:each) do
    assign(:payments, [
      stub_model(Payment,
        :booking_id => 1,
        :customer_id => 2,
        :method => "Method",
        :auth_code => "Auth Code",
        :amount => "9.99",
        :confirmed_by => 3,
        :status => "Status",
        :user_id => 4,
        :college_id => 5,
        :data => "Data"
      ),
      stub_model(Payment,
        :booking_id => 1,
        :customer_id => 2,
        :method => "Method",
        :auth_code => "Auth Code",
        :amount => "9.99",
        :confirmed_by => 3,
        :status => "Status",
        :user_id => 4,
        :college_id => 5,
        :data => "Data"
      )
    ])
  end

  it "renders a list of payments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Method".to_s, :count => 2
    assert_select "tr>td", :text => "Auth Code".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Data".to_s, :count => 2
  end
end
