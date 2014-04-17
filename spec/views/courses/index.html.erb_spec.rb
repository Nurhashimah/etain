require 'spec_helper'

describe "courses/index" do
  before(:each) do
    assign(:courses, [
      stub_model(Course,
        :code => "Code",
        :category => "Category",
        :topic => "Topic",
        :description => "Description",
        :fee => "9.99",
        :duration => 1,
        :duration_type => "Duration Type",
        :user_id => 2,
        :college_id => 3,
        :data => "Data"
      ),
      stub_model(Course,
        :code => "Code",
        :category => "Category",
        :topic => "Topic",
        :description => "Description",
        :fee => "9.99",
        :duration => 1,
        :duration_type => "Duration Type",
        :user_id => 2,
        :college_id => 3,
        :data => "Data"
      )
    ])
  end

  it "renders a list of courses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Topic".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Duration Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Data".to_s, :count => 2
  end
end
