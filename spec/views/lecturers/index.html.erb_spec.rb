require 'spec_helper'

describe "lecturers/index" do
  before(:each) do
    assign(:lecturers, [
      stub_model(Lecturer,
        :name => "Name",
        :details => "MyText",
        :rate => "9.99",
        :user_id => 1,
        :college_id => 2,
        :data => "Data"
      ),
      stub_model(Lecturer,
        :name => "Name",
        :details => "MyText",
        :rate => "9.99",
        :user_id => 1,
        :college_id => 2,
        :data => "Data"
      )
    ])
  end

  it "renders a list of lecturers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Data".to_s, :count => 2
  end
end
