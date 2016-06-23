class Schedule < ActiveRecord::Base
  belongs_to :schedulecourse, class_name: 'Course', foreign_key: 'course_id'
  belongs_to :schedulelocation, class_name: 'Location', foreign_key: 'location_id'
  belongs_to :schedulelecturer, class_name: 'Lecturer', foreign_key: 'lecturer_id'
  
  # define scope
  def self.coursetitle_search(query) 
    course_ids=Course.where('topic ILIKE(?)', "%#{query}%").pluck(:id)
    where('course_id IN(?)', course_ids)
  end
  
  def self.locationname_search(query)
    location_ids=Location.where('name ILIKE(?)', "%#{query}%").pluck(:id)
    where('location_id IN(?)', location_ids)
  end
  
  def self.lecturername_search(query)
    lecturer_ids=Lecturer.where('name ILIKE(?)', "%#{query}%").pluck(:id)
    where('lecturer_id IN(?)', lecturer_ids)
  end
  
  # whitelist the scope
  def self.ransackable_scopes(auth_object = nil)
    [:coursetitle_search, :locationname_search, :lecturername_search]
  end
  
end
