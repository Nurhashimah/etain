require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location,
      :location_id => 1,
      :name => "MyString",
      :description => "MyText",
      :user_id => 1,
      :college_id => 1,
      :data => "MyString"
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", locations_path, "post" do
      assert_select "input#location_location_id[name=?]", "location[location_id]"
      assert_select "input#location_name[name=?]", "location[name]"
      assert_select "textarea#location_description[name=?]", "location[description]"
      assert_select "input#location_user_id[name=?]", "location[user_id]"
      assert_select "input#location_college_id[name=?]", "location[college_id]"
      assert_select "input#location_data[name=?]", "location[data]"
    end
  end
end
