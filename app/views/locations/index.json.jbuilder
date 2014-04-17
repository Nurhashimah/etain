json.array!(@locations) do |location|
  json.extract! location, :id, :location_id, :name, :description, :user_id, :college_id, :data
  json.url location_url(location, format: :json)
end
