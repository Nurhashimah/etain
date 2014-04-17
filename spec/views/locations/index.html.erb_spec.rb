require 'spec_helper'

describe "locations/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :location_id => 1,
        :name => "Name",
        :description => "MyText",
        :user_id => 2,
        :college_id => 3,
        :data => "Data"
      ),
      stub_model(Location,
        :location_id => 1,
        :name => "Name",
        :description => "MyText",
        :user_id => 2,
        :college_id => 3,
        :data => "Data"
      )
    ])
  end

  it "renders a list of locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Data".to_s, :count => 2
  end
end
