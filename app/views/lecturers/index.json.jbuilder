json.array!(@lecturers) do |lecturer|
  json.extract! lecturer, :id, :name, :details, :rate, :user_id, :college_id, :data
  json.url lecturer_url(lecturer, format: :json)
end
