class Rank < ActiveRecord::Base
  has_many :participants, class_name: 'Customer' 
  
  def description
    "#{shortname} - #{name}"
  end

  def render_category
    DropDown::CATEGORY.find_all{|disp, value| value==category}.map{|disp, value| disp}[0]
  end
  
  def render_rate
    DropDown::RATE.find_all{|disp, value| value==rate}.map{|disp, value| disp}[0] 
  end
end
