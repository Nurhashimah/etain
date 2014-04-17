require 'spec_helper'

describe "payments/edit" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :booking_id => 1,
      :customer_id => 1,
      :method => "MyString",
      :auth_code => "MyString",
      :amount => "9.99",
      :confirmed_by => 1,
      :status => "MyString",
      :user_id => 1,
      :college_id => 1,
      :data => "MyString"
    ))
  end

  it "renders the edit payment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do
      assert_select "input#payment_booking_id[name=?]", "payment[booking_id]"
      assert_select "input#payment_customer_id[name=?]", "payment[customer_id]"
      assert_select "input#payment_method[name=?]", "payment[method]"
      assert_select "input#payment_auth_code[name=?]", "payment[auth_code]"
      assert_select "input#payment_amount[name=?]", "payment[amount]"
      assert_select "input#payment_confirmed_by[name=?]", "payment[confirmed_by]"
      assert_select "input#payment_status[name=?]", "payment[status]"
      assert_select "input#payment_user_id[name=?]", "payment[user_id]"
      assert_select "input#payment_college_id[name=?]", "payment[college_id]"
      assert_select "input#payment_data[name=?]", "payment[data]"
    end
  end
end
