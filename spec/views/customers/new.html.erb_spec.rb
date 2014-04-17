require 'spec_helper'

describe "customers/new" do
  before(:each) do
    assign(:customer, stub_model(Customer,
      :id_no => "MyString",
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :corporate => false,
      :company_id => 1,
      :user_id => 1,
      :college_id => 1,
      :data => "MyString"
    ).as_new_record)
  end

  it "renders new customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customers_path, "post" do
      assert_select "input#customer_id_no[name=?]", "customer[id_no]"
      assert_select "input#customer_name[name=?]", "customer[name]"
      assert_select "input#customer_email[name=?]", "customer[email]"
      assert_select "input#customer_phone[name=?]", "customer[phone]"
      assert_select "input#customer_corporate[name=?]", "customer[corporate]"
      assert_select "input#customer_company_id[name=?]", "customer[company_id]"
      assert_select "input#customer_user_id[name=?]", "customer[user_id]"
      assert_select "input#customer_college_id[name=?]", "customer[college_id]"
      assert_select "input#customer_data[name=?]", "customer[data]"
    end
  end
end
