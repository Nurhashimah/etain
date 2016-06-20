class Course < ActiveRecord::Base
  has_many :schedules, foreign_key: "course_id"
  
  def duration_details
    (DropDown::DURATION_TYPE.find_all{|disp, value| value==duration_type}).map{|disp, value|disp}.first.to_s
  end
end
