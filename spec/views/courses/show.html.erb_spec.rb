require 'spec_helper'

describe "courses/show" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Category/)
    rendered.should match(/Topic/)
    rendered.should match(/Description/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/Duration Type/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Data/)
  end
end
