require 'spec_helper'

describe "customers/show" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :id_no => "Id No",
      :name => "Name",
      :email => "Email",
      :phone => "Phone",
      :corporate => false,
      :company_id => 1,
      :user_id => 2,
      :college_id => 3,
      :data => "Data"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Id No/)
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Phone/)
    rendered.should match(/false/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Data/)
  end
end
