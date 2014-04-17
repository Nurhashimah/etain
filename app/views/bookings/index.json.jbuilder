json.array!(@bookings) do |booking|
  json.extract! booking, :id, :code, :schedule_id, :customer_id, :payment_id, :warranty_id, :status, :user_id, :college_id, :data
  json.url booking_url(booking, format: :json)
end
