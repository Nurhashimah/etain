require 'spec_helper'

describe "schedules/index" do
  before(:each) do
    assign(:schedules, [
      stub_model(Schedule,
        :course_id => 1,
        :location_id => 2,
        :lecturer_by => "",
        :max_people => 3,
        :status => "Status",
        :user_id => 4,
        :college_id => 5,
        :data => "Data"
      ),
      stub_model(Schedule,
        :course_id => 1,
        :location_id => 2,
        :lecturer_by => "",
        :max_people => 3,
        :status => "Status",
        :user_id => 4,
        :college_id => 5,
        :data => "Data"
      )
    ])
  end

  it "renders a list of schedules" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Data".to_s, :count => 2
  end
end
