class Payment < ActiveRecord::Base
  
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
