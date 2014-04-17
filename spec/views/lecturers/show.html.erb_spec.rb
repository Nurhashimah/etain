require 'spec_helper'

describe "lecturers/show" do
  before(:each) do
    @lecturer = assign(:lecturer, stub_model(Lecturer,
      :name => "Name",
      :details => "MyText",
      :rate => "9.99",
      :user_id => 1,
      :college_id => 2,
      :data => "Data"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Data/)
  end
end
