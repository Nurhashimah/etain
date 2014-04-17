require 'spec_helper'

describe "schedules/show" do
  before(:each) do
    @schedule = assign(:schedule, stub_model(Schedule,
      :course_id => 1,
      :location_id => 2,
      :lecturer_by => "",
      :max_people => 3,
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
    rendered.should match(//)
    rendered.should match(/3/)
    rendered.should match(/Status/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/Data/)
  end
end
