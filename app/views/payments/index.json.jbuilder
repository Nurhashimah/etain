json.array!(@payments) do |payment|
  json.extract! payment, :id, :booking_id, :customer_id, :method, :auth_code, :amount, :confirmed_by, :confirmed_on, :status, :user_id, :college_id, :data
  json.url payment_url(payment, format: :json)
end
