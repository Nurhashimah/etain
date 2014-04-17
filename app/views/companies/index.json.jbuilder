json.array!(@companies) do |company|
  json.extract! company, :id, :company_code, :name, :address, :phone, :email, :fax, :user_id, :college_id, :data
  json.url company_url(company, format: :json)
end
