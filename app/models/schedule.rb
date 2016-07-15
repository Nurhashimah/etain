class Schedule < ActiveRecord::Base
  belongs_to :schedulecourse, class_name: 'Course', foreign_key: 'course_id'
  belongs_to :schedulelocation, class_name: 'Location', foreign_key: 'location_id'
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :lecturers
  has_many :bookings, dependent: :restrict_with_error
  has_one :payment
  
  validates :course_id, :max_people, :start_on, :end_on, presence: true 
  validate :end_on_should_later_than_start_on

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
  
  def schedule_course_details
    start_on.strftime('%d/%m/%y')+" - "+end_on.strftime('%d/%m/%y')+" - "+schedulecourse.topic
  end
  
  def self.available_schedule
    schedule_ids=Array.new
    Schedule.all.each{|x|schedule_ids << x.id if x.customers.count < x.max_people}
    where(id: schedule_ids)
  end
  
  def end_on_should_later_than_start_on
    if end_on && start_on && end_on < start_on && end_on < DateTime.now
      errors.add(:base, I18n.t('activerecord.attributes.schedule.begin_before_ends'))
    end
  end

end
