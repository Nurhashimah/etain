require 'spec_helper'

describe "companies/new" do
  before(:each) do
    assign(:company, stub_model(Company,
      :company_code => "MyString",
      :name => "MyString",
      :address => "MyText",
      :phone => "MyString",
      :email => "MyString",
      :fax => "MyString",
      :user_id => 1,
      :college_id => 1,
      :data => "MyString"
    ).as_new_record)
  end

  it "renders new company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", companies_path, "post" do
      assert_select "input#company_company_code[name=?]", "company[company_code]"
      assert_select "input#company_name[name=?]", "company[name]"
      assert_select "textarea#company_address[name=?]", "company[address]"
      assert_select "input#company_phone[name=?]", "company[phone]"
      assert_select "input#company_email[name=?]", "company[email]"
      assert_select "input#company_fax[name=?]", "company[fax]"
      assert_select "input#company_user_id[name=?]", "company[user_id]"
      assert_select "input#company_college_id[name=?]", "company[college_id]"
      assert_select "input#company_data[name=?]", "company[data]"
    end
  end
end
