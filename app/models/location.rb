class Location < ActiveRecord::Base
  has_many :schedules
  
  def region_details
    (DropDown::REGION.find_all{|disp, value| value==region}).map{|disp, value|disp}.first
  end
end
