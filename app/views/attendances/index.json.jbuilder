json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :schedule_id, :customer_id, :attended, :taken_on
  json.url attendance_url(attendance, format: :json)
end
