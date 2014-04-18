class Schedule < ActiveRecord::Base
  
  belong_to :course,                foreign_key: "course_id"
end
