require 'spec_helper'

describe "attendances/show" do
  before(:each) do
    @attendance = assign(:attendance, stub_model(Attendance,
      :schedule_id => 1,
      :customer_id => 2,
      :attended => false,
      :taken_on => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
    rendered.should match(//)
  end
end
