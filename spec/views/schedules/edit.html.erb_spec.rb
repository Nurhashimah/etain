require 'spec_helper'

describe "schedules/edit" do
  before(:each) do
    @schedule = assign(:schedule, stub_model(Schedule,
      :course_id => 1,
      :location_id => 1,
      :lecturer_by => "",
      :max_people => 1,
      :status => "MyString",
      :user_id => 1,
      :college_id => 1,
      :data => "MyString"
    ))
  end

  it "renders the edit schedule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", schedule_path(@schedule), "post" do
      assert_select "input#schedule_course_id[name=?]", "schedule[course_id]"
      assert_select "input#schedule_location_id[name=?]", "schedule[location_id]"
      assert_select "input#schedule_lecturer_by[name=?]", "schedule[lecturer_by]"
      assert_select "input#schedule_max_people[name=?]", "schedule[max_people]"
      assert_select "input#schedule_status[name=?]", "schedule[status]"
      assert_select "input#schedule_user_id[name=?]", "schedule[user_id]"
      assert_select "input#schedule_college_id[name=?]", "schedule[college_id]"
      assert_select "input#schedule_data[name=?]", "schedule[data]"
    end
  end
end
