require 'spec_helper'

describe "locations/show" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :location_id => 1,
      :name => "Name",
      :description => "MyText",
      :user_id => 2,
      :college_id => 3,
      :data => "Data"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Data/)
  end
end
