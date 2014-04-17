require 'spec_helper'

describe "bookings/index" do
  before(:each) do
    assign(:bookings, [
      stub_model(Booking,
        :code => "Code",
        :schedule_id => 1,
        :customer_id => 2,
        :payment_id => 3,
        :warranty_id => 4,
        :status => "Status",
        :user_id => 5,
        :college_id => 6,
        :data => "Data"
      ),
      stub_model(Booking,
        :code => "Code",
        :schedule_id => 1,
        :customer_id => 2,
        :payment_id => 3,
        :warranty_id => 4,
        :status => "Status",
        :user_id => 5,
        :college_id => 6,
        :data => "Data"
      )
    ])
  end

  it "renders a list of bookings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => "Data".to_s, :count => 2
  end
end
