require 'spec_helper'

describe "payments/show" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Method/)
    rendered.should match(/Auth Code/)
    rendered.should match(/9.99/)
    rendered.should match(/3/)
    rendered.should match(/Status/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/Data/)
  end
end
