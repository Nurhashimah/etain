require 'spec_helper'

describe "bookings/show" do
  before(:each) do
    @booking = assign(:booking, stub_model(Booking,
      :code => "Code",
      :schedule_id => 1,
      :customer_id => 2,
      :payment_id => 3,
      :warranty_id => 4,
      :status => "Status",
      :user_id => 5,
      :college_id => 6,
      :data => "Data"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/Status/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/Data/)
  end
end
