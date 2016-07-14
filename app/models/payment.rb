class Payment < ActiveRecord::Base
  belongs_to :booking, foreign_key: 'booking_id'
  #customer_id?
  belongs_to :authorised_payer, class_name: 'Customer', foreign_key: 'confirmed_by'
  validates :booking_id, :confirmed_by, presence: true

  #define scope
  def self.confirmed_on_search(query)
    today=query.to_date.beginning_of_day
    where('confirmed_on >=? AND confirmed_on <?', today, today.tomorrow)
  end
  
  #ransackable
  def self.ransackable_scopes(auth_object = nil)
    [:confirmed_on_search]
  end
  
end
