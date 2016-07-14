class Booking < ActiveRecord::Base
  belongs_to :schedule, foreign_key: 'schedule_id'
  belongs_to :participant, class_name: 'Customer', foreign_key: 'customer_id'
  has_one :payment
  
  validates :customer_id, uniqueness: { scope: :schedule_id, message: I18n.t('activerecord.attributes.booking.unique_applicant') }
  validates :schedule_id, :customer_id, presence: true
  
  def schedule_details
    participant.name+" ("+schedule.schedule_course_details+")"
  end
end
