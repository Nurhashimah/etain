class Payment < ActiveRecord::Base
  belongs_to :booking, foreign_key: 'booking_id'
  belongs_to :schedule, foreign_key: 'schedule_id'
  #customer_id?
  belongs_to :authorised_payer, class_name: 'Customer', foreign_key: 'confirmed_by'
  validates :confirmed_by, :method, :amount,  presence: true
  validates :amount, numericality: true
  validate :pay_booking_or_schedule
  
  attr_accessor :by_booking

  #define scope
  def self.confirmed_on_search(query)
    today=query.to_date.beginning_of_day
    where('confirmed_on >=? AND confirmed_on <?', today, today.tomorrow)
  end
  
  def self.booking_schedule_search(query)
    course_ids=Course.where('topic ILIKE(?)', "%#{query}%").pluck(:id)
    schedule_ids=Schedule.where(course_id: course_ids).pluck(:id)
    booking_ids=Booking.where(schedule_id: schedule_ids).pluck(:id)
    where('schedule_id IN(?) or booking_id IN(?)', schedule_ids, booking_ids)
  end
  
  #ransackable
  def self.ransackable_scopes(auth_object = nil)
    [:confirmed_on_search, :booking_schedule_search]
  end
  
  def pay_booking_or_schedule
    if booking_id==nil && schedule_id==nil
      errors.add(:base, I18n.t('activerecord.attributes.payment.select_one'))
    elsif (booking_id!=nil && schedule_id !=nil)
      errors.add(:base, I18n.t('activerecord.attributes.payment.choose_one'))
    end
  end
  
end
