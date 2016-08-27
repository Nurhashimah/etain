class Course < ActiveRecord::Base
  has_many :schedules, dependent: :restrict_with_error
  
  serialize :details, Hash
  
  validates :topic, presence: true
  
  def duration_details
    (DropDown::DURATION_TYPE.find_all{|disp, value| value==duration_type}).map{|disp, value|disp}.first.to_s
  end
  
  def owner=(value)
    details[:owner] = value
  end
  def owner
    details[:owner]
  end
  
  def organizer=(value)
    details[:organizer] = value
  end
  def organizer
    details[:organizer]
  end
  
  def course_owner
    Company.where(id: owner).first.try(:name)
  end
  
  def course_organizer
    Company.where(id: organizer).first.try(:name)
  end
  
  #define scope
  def self.organizer_search(query)
    a=Company.where('name ILIKE ?', "%#{query}%").pluck(:id)
    company_ids_str=[]       
    a.each{|x|company_ids_str << x.to_s}
    ids=Array.new
    Course.pluck(:id, :details).each{|det| ids << det[0] if company_ids_str.include?(det[1][:organizer])}
    where(id: ids)
  end
  
  def self.frequency_search(query)
    if query
      selected_date=query.to_date
      schedules_selected_year=Schedule.where('start_on >=? and start_on <=?', selected_date.beginning_of_year, selected_date.end_of_year)
      course_ids=schedules_selected_year.pluck(:course_id)
      where(id: course_ids)
    end
  end
  
  #ransackable
  def self.ransackable_scopes(auth_object = nil)
     [:organizer_search, :frequency_search]
  end

end
