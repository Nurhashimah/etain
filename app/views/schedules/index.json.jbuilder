json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :course_id, :scheduled_on, :location_id, :lecturer_by, :max_people, :status, :user_id, :college_id, :data
  json.url schedule_url(schedule, format: :json)
end
