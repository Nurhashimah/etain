require 'spec_helper'

describe "bookings/edit" do
  before(:each) do
    @booking = assign(:booking, stub_model(Booking,
      :code => "MyString",
      :schedule_id => 1,
      :customer_id => 1,
      :payment_id => 1,
      :warranty_id => 1,
      :status => "MyString",
      :user_id => 1,
      :college_id => 1,
      :data => "MyString"
    ))
  end

  it "renders the edit booking form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", booking_path(@booking), "post" do
      assert_select "input#booking_code[name=?]", "booking[code]"
      assert_select "input#booking_schedule_id[name=?]", "booking[schedule_id]"
      assert_select "input#booking_customer_id[name=?]", "booking[customer_id]"
      assert_select "input#booking_payment_id[name=?]", "booking[payment_id]"
      assert_select "input#booking_warranty_id[name=?]", "booking[warranty_id]"
      assert_select "input#booking_status[name=?]", "booking[status]"
      assert_select "input#booking_user_id[name=?]", "booking[user_id]"
      assert_select "input#booking_college_id[name=?]", "booking[college_id]"
      assert_select "input#booking_data[name=?]", "booking[data]"
    end
  end
end
