require 'spec_helper'

describe "courses/new" do
  before(:each) do
    assign(:course, stub_model(Course,
      :code => "MyString",
      :category => "MyString",
      :topic => "MyString",
      :description => "MyString",
      :fee => "9.99",
      :duration => 1,
      :duration_type => "MyString",
      :user_id => 1,
      :college_id => 1,
      :data => "MyString"
    ).as_new_record)
  end

  it "renders new course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", courses_path, "post" do
      assert_select "input#course_code[name=?]", "course[code]"
      assert_select "input#course_category[name=?]", "course[category]"
      assert_select "input#course_topic[name=?]", "course[topic]"
      assert_select "input#course_description[name=?]", "course[description]"
      assert_select "input#course_fee[name=?]", "course[fee]"
      assert_select "input#course_duration[name=?]", "course[duration]"
      assert_select "input#course_duration_type[name=?]", "course[duration_type]"
      assert_select "input#course_user_id[name=?]", "course[user_id]"
      assert_select "input#course_college_id[name=?]", "course[college_id]"
      assert_select "input#course_data[name=?]", "course[data]"
    end
  end
end
