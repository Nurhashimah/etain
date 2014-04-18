class Schedule < ActiveRecord::Base
  
  belongs_to :course,                foreign_key: "course_id"
end
