class Course < ActiveRecord::Base
  
  has_many :schedules,                foreign_key: "course_id"
end
