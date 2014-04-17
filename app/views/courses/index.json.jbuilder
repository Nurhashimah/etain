json.array!(@courses) do |course|
  json.extract! course, :id, :code, :category, :topic, :description, :fee, :duration, :duration_type, :user_id, :college_id, :data
  json.url course_url(course, format: :json)
end
