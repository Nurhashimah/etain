json.array!(@customers) do |customer|
  json.extract! customer, :id, :id_no, :name, :email, :phone, :corporate, :company_id, :user_id, :college_id, :data
  json.url customer_url(customer, format: :json)
end
