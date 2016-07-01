class Location < ActiveRecord::Base
  has_many :schedules
  validates :name, presence: true
  
  def region_details
    (DropDown::REGION.find_all{|disp, value| value==region}).map{|disp, value|disp}.first
  end
end
