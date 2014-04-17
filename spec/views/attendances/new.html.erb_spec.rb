require 'spec_helper'

describe "attendances/new" do
  before(:each) do
    assign(:attendance, stub_model(Attendance,
      :schedule_id => 1,
      :customer_id => 1,
      :attended => false,
      :taken_on => ""
    ).as_new_record)
  end

  it "renders new attendance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attendances_path, "post" do
      assert_select "input#attendance_schedule_id[name=?]", "attendance[schedule_id]"
      assert_select "input#attendance_customer_id[name=?]", "attendance[customer_id]"
      assert_select "input#attendance_attended[name=?]", "attendance[attended]"
      assert_select "input#attendance_taken_on[name=?]", "attendance[taken_on]"
    end
  end
end
